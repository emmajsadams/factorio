// TODO: maybe make a requester that gets rid of everything not expected at that depot and provides it to base? probably overkill tbh
// TODO: create a parking spot at each place. auto traveling to any other stops fucks with ltn
// TODO: manually move all the supplies that accidentally ended up at train depot!
// TODO: maybe make a waiting bay at each stop so that trains can pile up waiting for multiple deliveies?
// TODO: add multiple pickups. then change dropoff and pickup to max train 1

import * as fs from "fs";
import * as path from "path";

const networkId = 1;
const baseSupplyAmount = 20;
const baseSupplyMinAmount = 10;
const baseSupplies = ["fast-transport-belt", "repair-pack", "speed-module-3"]; // TODO: expand on this
const miningBaseSupplies = ["electric-mining-drill"].concat(baseSupplies);
const powerPlantSupplies = ["uranium-fuel-cell"].concat(baseSupplies);
const oilDrillingSupplies = ["empty-barrel"].concat(baseSupplies);
const outputDirectory = path.join(__dirname, "trains");
const centralCommandProviderOutputDirectory = path.join(
  outputDirectory,
  "centralCommandProviders"
);
console.log(centralCommandProviderOutputDirectory);

// TODO: just make this a a parameter
const priorities = {
  "base-supplies": 60, // base needs repairing
  "uranium-power-plant": 50,
  // TODO add others
};

const providerChestOverrides = {
  "empty-barrel": 400,
  "uranium-fuel-cell": 400,
  "solid-fuel": 200,
};

const generateBaseSupplies = (supplies: string[], fileName: string): void => {
  let baseSuppliesLua = "";
  for (const baseSupply of supplies) {
    baseSuppliesLua += `out['${baseSupply}'] = green['${baseSupply}'] - ${baseSupplyAmount}\n`;
  }

  const baseSuppliesRequesterLua = `
out['ltn-network-id'] = ${networkId}
out['ltn-max-trains'] = 1
out['ltn-requester-priority'] = ${priorities["base-supplies"]}
out['ltn-requester-threshold'] = ${baseSupplyMinAmount}
${baseSuppliesLua}
  `;

  fs.writeFileSync(
    path.join(outputDirectory, fileName),
    baseSuppliesRequesterLua
  );
};

const generateCentralCommandProvider = (allSupplies: string[][]): void => {
  const allSuppliesUnique = new Set();
  for (const supplies of allSupplies) {
    for (const baseSupply of supplies) {
      allSuppliesUnique.add(baseSupply);
    }
  }

  allSuppliesUnique.forEach((baseSupply) => {
    const baseSuppliesRequesterLua = `
out['ltn-network-id'] = 1
out['ltn-disable-warnings'] = 1
out['${baseSupply}'] = 9999
out['ltn-provider-priority'] = 9999
  `;
    fs.writeFileSync(
      path.join(
        centralCommandProviderOutputDirectory,
        `${baseSupply}_provider.lua`
      ),
      baseSuppliesRequesterLua
    );

    const requesterAmount = providerChestOverrides[baseSupply as any] || 20;
    const baseSuppliesRequesterChestLua = `
out['${baseSupply}'] = ${requesterAmount}
if red['signal-blue'] == 1 then
  out['signal-info'] = 1
else
  out['signal-info'] = nil
end

  `;
    fs.writeFileSync(
      path.join(
        centralCommandProviderOutputDirectory,
        `${baseSupply}_chest.lua`
      ),
      baseSuppliesRequesterChestLua
    );
  });
};

const generateTrainDepot = () => {
  const depotLua = `
out['ltn-depot'] = 1
out['ltn-depot-priority'] = 1
out['ltn-network-id'] = 1
  `;
  fs.writeFileSync(path.join(outputDirectory, `train_depot.lua`), depotLua);
};

// TODO: move this into a separate file and reuse it in several scripts
function cleanDirectory(directory: string): void {
  if (fs.existsSync(directory)) {
    fs.rmSync(directory, { recursive: true });
  }

  fs.mkdirSync(directory);
}

cleanDirectory(outputDirectory);
cleanDirectory(centralCommandProviderOutputDirectory);
generateBaseSupplies(baseSupplies, "generic_base_supply_requester.lua");
generateBaseSupplies(miningBaseSupplies, "mining_base_supply_requester.lua");
generateBaseSupplies(powerPlantSupplies, "power_plant_supply_requester.lua");
generateBaseSupplies(oilDrillingSupplies, "oil_drill_supply_requester.lua");
generateTrainDepot();
generateCentralCommandProvider([
  baseSupplies,
  miningBaseSupplies,
  powerPlantSupplies,
  oilDrillingSupplies,
  ["solid-fuel"], // tempworkaround atm
]);
