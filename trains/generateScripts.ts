import * as fs from "fs";
import * as path from "path";

// TODO: Create a provider script that goes through everything that is not on this list and sends it out.
// Basically iterate through logistic network supplies and ignore anything specified here
// TODO: Create an alert script that warns when any of these supplies are low (maybe this is just ltn, if I pipe through the real amount??)

// higher is more priority
const baseSuppliesPriority = 60;
const baseSuppliesAmount = 100;
const baseSuppliesRequestThreshold = 50;

const generatedOutputDirectory = path.join(__dirname, "generated");

// DONT EVER CHANGE THE ORDER OF ANYTHING OTHERWISE I RECONFIGURE!
const essentialBaseSupplies = [
  "repair-pack",
  "artillery-shell",
  "artillery-turret",
  "laser-turret",
  "steel-wall",
  "roboport",
  "se-pylon-construction-radar",
  "logistic-train-stop",
  "rail-signal",
  "mlc",
  "rail",
  "aai-warehouse-storage",
  "aai-warehouse-active-provider",
  "aai-warehouse-requester",
  "logistic-chest-requester",
  "logistic-chest-active-provider",
  "stack-inserter",
  "small-lamp",
  "construction-robot",
  "logistic-robot",
];
// TODO: move offshore pumps to separate power grid that is powered off solar and backup accumulators
const nuclearPowerPlantSupplies = essentialBaseSupplies.concat([
  "uranium-fuel-cell",
  "pipe",
  "pipe-to-ground",
  "steam-turbine",
  "nuclear-reactor",
  "heat-pipe",
  "heat-exchanger",
  "offshore-pump",
  "se-space-solar-panel",
]);
const oilFieldSupplies = essentialBaseSupplies.concat([
  "pumpjack",
  "pipe",
  "pipe-to-ground",
  "speed-module-3",
]);
const uraniumMineSupplies = essentialBaseSupplies.concat([
  "electric-mining-drill",
  "assembling-machine-3",
  "express-transport-belt",
  "express-underground-belt",
  "sulfuric-acid-barrel",
]);
// TODO: just create a map out of this instead and iterate over it
const allSupplies = [
  essentialBaseSupplies,
  nuclearPowerPlantSupplies,
  oilFieldSupplies,
  uraniumMineSupplies,
];
// TODO: find a way to guarentee this ordering so I never have to reconfigure
// anything new should be added on to the end no matter what
// must each be 12!!
const stableOrder = [
  [
    "repair-pack",
    "artillery-shell",
    "artillery-turret",
    "laser-turret",
    "steel-wall",
    "roboport",
    "se-pylon-construction-radar",
    "logistic-train-stop",
    "rail-signal",
    "mlc",
    "rail",
    "aai-warehouse-storage",
  ],
  [
    "aai-warehouse-active-provider",
    "aai-warehouse-requester",
    "logistic-chest-requester",
    "logistic-chest-active-provider",
    "stack-inserter",
    "small-lamp",
    "uranium-fuel-cell",
    "pipe",
    "pipe-to-ground",
    "steam-turbine",
    "nuclear-reactor",
    "heat-pipe",
  ],
  [
    "heat-exchanger",
    "offshore-pump",
    "se-space-solar-panel",
    "pumpjack",
    "speed-module-3",
    "electric-mining-drill",
    "assembling-machine-3",
    "express-transport-belt",
    "express-underground-belt",
    "construction-robot",
    "logistic-robot",
    "sulfuric-acid-barrel",
  ],
];

// TODO: maybe make this a static order so I never have to reconfigure. look at the current order and define it via script
function getAllUniqueSupplies(): Set<string> {
  const allSuppliesUnique = new Set<string>();
  for (const supplies of allSupplies) {
    for (const baseSupply of supplies) {
      allSuppliesUnique.add(baseSupply);
    }
  }

  let length = 0;
  stableOrder.forEach((stableOrderGroup) => {
    if (stableOrderGroup.length > 12) {
      throw new Error("groups must be no greater than 12 in length"); // TODO: also assert only the last can be less
    }

    stableOrderGroup.forEach((resource) => {
      if (!allSuppliesUnique.has(resource)) {
        throw new Error("supply missing from stable order");
      }
      length += 1;
    });
  });

  if (length != allSuppliesUnique.size) {
    throw new Error("length of stable order does not match all supplies");
  }

  return allSuppliesUnique;
}

interface Supplies {
  [resource: string]: string;
}

function generateProvidedResources() {
  const allSuppliesUnique = getAllUniqueSupplies();

  const baseSuppliesLuaScripts: Supplies = {};
  let count = 0;
  allSuppliesUnique.forEach((resource) => {
    baseSuppliesLuaScripts[
      resource
    ] = `out['${resource}'] = ${baseSuppliesAmount}\n`;
    count++;
  });

  stableOrder.forEach((stableOrderGroup, groupNumber) => {
    let providerLua = "";
    let chest1 = "";
    let chest2 = "";

    stableOrderGroup.forEach((resource, groupIndex) => {
      const resourceLua = baseSuppliesLuaScripts[resource];
      providerLua += baseSuppliesLuaScripts[resource];

      if (groupIndex <= 5) {
        chest1 += `${resourceLua}`;
      } else {
        chest2 += `${resourceLua}`;
      }
    });

    // TODO: add back max trains?
    // out["ltn-max-trains"] = 1;

    const providedResourcesLua = `
out['ltn-network-id'] = 1
out['ltn-disable-warnings'] = 1
out['ltn-provider-priority'] = 999999999
out['ltn-provider-threshold'] = 1

${providerLua.trim()}
`.trim();
    writeFile(
      `central_command_provider_${groupNumber + 1}.lua`,
      providedResourcesLua
    );

    writeFile(
      `central_command_provider_${groupNumber + 1}_chest_1.lua`,
      chest1
    );
    if (chest2) {
      writeFile(
        `central_command_provider_${groupNumber + 1}_chest_2.lua`,
        chest2
      );
    }
  });
}

// function generateProvidedResourcesChest() {
//   const allSuppliesUnique = getAllUniqueSupplies();

//   const baseSuppliesChestLuaScripts: string[] = [];
//   let count = 1;
//   allSuppliesUnique.forEach((resource) => {
//     let baseSupplyIndex = Math.floor(count / 12) - 1;
//     const currentLuaValue = baseSuppliesChestLuaScripts[baseSupplyIndex] || "";
//     baseSuppliesChestLuaScripts[baseSupplyIndex] =
//       currentLuaValue + `out['${resource}'] = ${baseSuppliesAmount}\n`;
//     count++;
//   });

//   baseSuppliesChestLuaScripts.forEach((baseSuppliesLuaScriptChest, index) => {
//     writeFile(
//       `central_command_provider_${index + 1}_chest_2.lua`,
//       baseSuppliesLuaScriptChest.chest2
//     );
//   });
// }

function generateBaseSuppliesRequester(
  fileName: string,
  baseSupplies: string[]
) {
  let baseSuppliesBody = "";
  Object.entries(baseSupplies).forEach(([_, resource]) => {
    baseSuppliesBody += `out['${resource}'] = green['${resource}'] - ${baseSuppliesAmount}\n`;
  });

  const baseSuppliesRequesterLua = `
out["ltn-network-id"] = 1;
out["ltn-max-trains"] = 1;
out["ltn-requester-priority"] = ${baseSuppliesPriority};
out["ltn-requester-threshold"] = ${baseSuppliesRequestThreshold};

${baseSuppliesBody}
`;

  writeFile(fileName, baseSuppliesRequesterLua);
}

function generateLowBaseSuppliesWarning() {}

function cleanDirectory(directory: string): void {
  if (fs.existsSync(directory)) {
    fs.rmSync(directory, { recursive: true });
  }

  fs.mkdirSync(directory);
}

function writeFile(name: string, contents: string) {
  fs.writeFileSync(path.join(generatedOutputDirectory, name), contents);
}

cleanDirectory(generatedOutputDirectory);
generateProvidedResources();
generateBaseSuppliesRequester(
  "essential_base_supplies_requester.lua",
  essentialBaseSupplies
);
generateBaseSuppliesRequester(
  "nuclear_power_plant_supplies_requester.lua",
  nuclearPowerPlantSupplies
);
generateBaseSuppliesRequester(
  "oil_field_supplies_requester.lua",
  oilFieldSupplies
);
generateBaseSuppliesRequester(
  "uranium_mine_supplies_requester.lua",
  uraniumMineSupplies
);
