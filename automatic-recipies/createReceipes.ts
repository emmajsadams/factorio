// TODO: Move base on moon and just use delivery cannon for basic resources. Then factories for everything else.
// -- anything that can't use a delivery cannon could just be manually moved occasionally by me or moved in bulk. this also gives me an opportunity to redesign my base
// -- also means less to defend since moon is safe from biters
// basicaly make anything that can be delivered via cannon, then use space assemblers on moon to make the rest

// TODO: consider just adding the inventory for the moon into this all around? or at least making science production tied to it?

// TODO: Filter on "category" : "crafting", then template out the lua scripts
// TODO: Use signal transmission to determine the supply needed on the moon!
import * as fs from "fs";
import * as path from "path";

const recipe = JSON.parse(
  fs.readFileSync(path.join(__dirname, "recipe.json")).toString()
);

/*
    local default_amount = 1500
    local default_ore_amount = 15000
    local default_processed_good_amount = 1000
    local default_base_building_amount = 200
    local default_barrel_amount = 500
    local default_science_amount = 1000
    */

const defaultScienceAmount = 2000;
const defaultBarrelAmount = 1000;
const fullOverrides = {
  "sulfuric-acid-barrel": {
    ingredientFactories: [{ name: "empty-barrel", amount: 300 }],
    amount: defaultBarrelAmount,
  },
  "crude-oil-barrel": {
    ingredientFactories: [{ name: "empty-barrel", amount: 300 }],
    amount: defaultBarrelAmount,
  },
  "water-barrel": {
    ingredientFactories: [{ name: "empty-barrel", amount: 300 }],
    amount: defaultBarrelAmount,
  },
  "heavy-oil-barrel": {
    ingredientFactories: [{ name: "empty-barrel", amount: 300 }],
    amount: defaultBarrelAmount,
  },
  "light-oil-barrel": {
    ingredientFactories: [{ name: "empty-barrel", amount: 300 }],
    amount: defaultBarrelAmount,
  },
  "lubricant-barrel": {
    ingredientFactories: [{ name: "empty-barrel", amount: 300 }],
    amount: defaultBarrelAmount,
  },
  "petroleum-gas-barrel": {
    ingredientFactories: [{ name: "empty-barrel", amount: 300 }],
    amount: defaultBarrelAmount,
  },
  "se-pyroflux-barrel": {
    ingredientFactories: [{ name: "empty-barrel", amount: 300 }],
    amount: defaultBarrelAmount,
  },
  "se-liquid-rocket-fuel-barrel": {
    ingredientFactories: [{ name: "empty-barrel", amount: 300 }],
    amount: defaultBarrelAmount,
  },
  "empty-barrel": {
    ingredientFactories: [{ name: "steel-plate", amount: 100 }],
    amount: 3000,
  },
  "chemical-science-pack": {
    ingredientFactories: [
      { name: "advanced-circuit", amount: 10 },
      { name: "sulfur", amount: 10 },
      { name: "engine-unit", amount: 10 },
    ],
    amount: defaultScienceAmount,
  },
  "se-rocket-science-pack": {
    ingredientFactories: [
      { name: "se-satellite-telemetry", amount: 10 },
      { name: "speed-module", amount: 10 },
      { name: "electric-furnace", amount: 10 },
    ],
    amount: defaultScienceAmount,
  },
  "logistic-science-pack": {
    ingredientFactories: [
      { name: "transport-belt", amount: 10 },
      { name: "inserter", amount: 10 },
    ],
    amount: defaultScienceAmount,
  },
  "automation-science-pack": {
    ingredientFactories: [
      { name: "iron-gear-wheel", amount: 10 },
      { name: "copper-plate", amount: 10 },
    ],
    amount: defaultScienceAmount,
  },
  "military-science-pack": {
    ingredientFactories: [
      { name: "piercing-rounds-magazine", amount: 10 },
      { name: "grenade", amount: 10 },
      { name: "stone-wall", amount: 10 },
    ],
    amount: defaultScienceAmount,
  },
  explosives: {
    ingredientFactories: [
      { name: "sulfur", amount: 100 },
      { name: "coal", amount: 100 },
    ],
    amount: defaultBarrelAmount,
  },
  sulfur: {
    ingredientFactories: [],
    amount: 500,
  },
  "processing-unit": {
    // { name: "sulfuric-acid-barrel", amount: 10 }
    ingredientFactories: [
      { name: "advanced-circuit", amount: 20 },
      { name: "electronic-circuit", amount: 10 },
    ],
    amount: 100,
  },
  "plastic-bar": {
    ingredientFactories: [{ name: "coal", amount: 100 }],
    amount: 500,
  },

  "fast-inserter": {
    ingredientFactories: [
      { name: "inserter", amount: 10 },
      { name: "iron-plate", amount: 20 },
      { name: "electronic-circuit", amount: 20 },
    ],
    amount: 500,
  },
};

const resourcesSentToOrbit = {
  "lubricant-barrel": {
    amount: 50,
  },
  "water-barrel": {
    amount: 50,
  },
  "rocket-fuel": {
    amount: 50,
  },
};

const resourceRequirementsOverrides: any = {
  "solid-fuel": 500,
  "rocket-fuel": 1000,
  "se-delivery-cannon-capsule": 1000,
  "logistic-robot": 500,
  "construction-robot": 500,

  // needed for space
  "electronic-circuit": 1000,
  "advanced-circuit": 1000,
  "stone-brick": 5000,
  sand: 5000,
  "storage-tank": 50,
  "copper-cable": 1000,
  "stone-tablet": 1000,
  pump: 100, // also base building stuff
  "fast-inserter": 200,
  "se-cargo-rocket-cargo-pod": 10, // needed for cargo rocket part
  "se-cargo-rocket-fuel-tank": 10,
  "se-cargo-rocket-section": 400,
};

const infiniteResources = ["iron-plate", "copper-plate"];

const resourceRequirements: any = {};

// { name: [{name, amount}]}
const ingredientFactories: any = {};

// electronic-circuit refers to the wood one, we want stone
const blacklist: any = ["loader", "distractor-capsule", "electronic-circuit"];

const temporarilyDisable = [];

const multiplier: any = {
  "electronic-circuit": 15,
  "advanced-circuit": 10,
  "iron-chest": 6,
  "fast-inserter": 10,
  "storage-tank": 3,
  "copper-cable": 300,
  pipe: 30,
  pump: 4,
  "electric-motor": 4,
};

const handleWeirdNames = (name: any): any => {
  if (name === "electronic-circuit-stone") {
    return "electronic-circuit";
  }

  return name;
};

Object.entries(recipe).forEach(([recipeName, value]) => {
  if (blacklist.includes(recipeName)) {
    return;
  }

  recipeName = handleWeirdNames(recipeName);

  const anyValue: any = value as any;
  if (anyValue["category"] != "crafting") {
    return;
  }
  const ingredients: any = anyValue["ingredients"];

  if (!ingredients || !ingredients.length) {
    return;
  }

  if (anyValue["hidden_from_player_crafting"]) {
    return;
  }

  if (anyValue["hidden"]) {
    return;
  }

  ingredientFactories[recipeName] = [];

  Object.entries(ingredients).forEach(([_, ingredient]) => {
    const anyIngredient: any = ingredient as any;
    if (blacklist.includes(anyIngredient["name"])) {
      return;
    }

    if (anyIngredient["type"] != "item") {
      throw new Error("should never happen");
    }

    setResourceRequirements(
      recipeName,
      handleWeirdNames(anyIngredient["name"] as any),
      anyIngredient["amount"] as any
    );
  });
});

function setResourceRequirements(
  recipeName: string,
  name: string,
  amount: number
) {
  if (multiplier[recipeName]) {
    amount = multiplier[recipeName] * amount;
  }

  if (!resourceRequirements[name]) {
    resourceRequirements[name] = 0;
  }

  if (!ingredientFactories[recipeName]) {
    ingredientFactories[recipeName] = [];
  }

  // maybe multiple amount by two or three to keep an extra stockpile?
  resourceRequirements[name] += amount;

  ingredientFactories[recipeName].push({ name, amount });
}

Object.entries(fullOverrides).forEach(([name, override]) => {
  resourceRequirements[name] = override.amount;
  ingredientFactories[name] = override.ingredientFactories;
});

Object.entries(resourceRequirementsOverrides).forEach(([recipeName, value]) => {
  resourceRequirements[recipeName] = value;
});

let lua_body = "";
Object.entries(resourceRequirements).forEach(
  ([resourceKey, resourceAmount]) => {
    if (
      fullOverrides[resourceKey] &&
      fullOverrides[resourceKey].ignoredByCentral
    ) {
      return;
    }
    lua_body += `  {'${resourceKey}', ${resourceAmount}},\n`;
  }
);

let disable_body = "";
Object.entries(temporarilyDisable).forEach(([_, resourceKey]) => {
  disable_body += `out['${resourceKey}'] = nil\n`;
});

// TODO: consider moving liquid storage to barrels. for facotires that need liquids I can have a local storage tank that is constanly filled so no shortage occurs. its way better since storage scales with any other item and I already barrel at oil outposts
// TODO: move more of the logic for creating this file into typescript and just duplicate if necessary for lua
// TODO: explicitly set blacklisted items to nil so I stop sending out signals
// TODO: figure out why it thinks barrels are needed, if not needed at to blacklist
// TODO: add overrides for base building items like tranports, ammo, roboports, etc...
// TODO: since I am redesining factoires anyways, make sure they handle >= 1 case. I want singal-info=2 to mean a shortage of the good is happening. signal-info=1 means the good should be produced but there is no danger of a shortage. I can define those thresholds here
const centralCommandLua = `
local resource_amounts =
{
${lua_body}
}

-- be careful with this for power usage. but this will keep producing as long as there is inventory
    -- TODO: move this into JS config
    local infinte_resources = {
      'iron-plate',
      'copper-plate',
    }

    -- TODO: move this into js config
    -- basically if the output of one of these blocks the other then we need to treat all as needed if any one of them is needed. this check is done after the main needs production check
    -- to avoid any sort of infinite loop
    local grouped_outputs = {
      {'light-oil-barrel', 'heavy-oil-barrel', 'petroleum-gas-barrel'}
    }

    -- set flag that resource should be produced
    for _, resource_amount_tuple in ipairs(resource_amounts)
    do
      local resource_amount_key = resource_amount_tuple[1]
      local resource_amount = resource_amount_tuple[2]
      if green[resource_amount_key] <= resource_amount then
        out[resource_amount_key] = 1
      else
        out[resource_amount_key] = 0
      end
    end

    -- set flag that resource should be produced infinitely
    for _, infinite_resource_key in ipairs(infinte_resources)
    do
      out[infinite_resource_key] = 1
    end

    -- set flag that resource should be produced infinitely
    for _, grouped_output_tuple in ipairs(grouped_outputs)
    do
      local needs_production = false
      for _, grouped_output_resource_key in ipairs(grouped_output_tuple)
      do
        for resource_key, production_value in pairs(out)
        do
          if resource_key == grouped_output_resource_key and production_value >= 1 then
            needs_production = true
          end
        end
      end

      if needs_production then
        for _, grouped_output_resource_key in ipairs(grouped_output_tuple)
        do
          out[grouped_output_resource_key] = 1
        end
      end
    end

${disable_body}
out['se-cargo-rocket-fuel-tank'] = 1 -- TODO: FOR SOME REASON THIS IS NECESSARY!!!! ITS JUST NOT PRODUCING???
`;
fs.writeFileSync(path.join(__dirname, "centralCommand.lua"), centralCommandLua);

Object.entries(ingredientFactories).forEach(([resourceKey, ingredients]) => {
  const anyIngredients = ingredients as any;

  let factoryRequiredResources = "";
  for (const ingredient of anyIngredients) {
    const anyIngredient: any = ingredient as any;
    factoryRequiredResources += `  {'${anyIngredient.name}', ${anyIngredient.amount}},`;
  }

  const factoryLua = `
local resource_key = '${resourceKey}'
local required_resources =
{
${factoryRequiredResources}
}

if red[resource_key] >= 1 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end

for _, required_resource_tuple in ipairs(required_resources)
do
  local required_resource_key = required_resource_tuple[1]
  local required_resource_amount = required_resource_tuple[2]

  if red[resource_key] >= 1 then
    out[required_resource_key] = required_resource_amount
  else
    out[required_resource_key] = nil
  end
end
  `;
  fs.writeFileSync(
    path.join(__dirname, "factories", `${resourceKey}.lua`),
    factoryLua
  );
});

Object.entries(resourcesSentToOrbit).forEach(
  ([resourceKey, resourcesSentToOrbit]) => {
    const factoryLua = `
local resource_key = '${resourceKey}'
local required_resources =
{
{ '${resourceKey}', ${resourcesSentToOrbit.amount} },
{ 'se-delivery-cannon-capsule', 2 },
}

-- for now we just keep sending it
out['signal-info'] = 1
for _, required_resource_tuple in ipairs(required_resources)
do
  local required_resource_key = required_resource_tuple[1]
  local required_resource_amount = required_resource_tuple[2]
  out[required_resource_key] = required_resource_amount
end
  `;
    fs.writeFileSync(
      path.join(__dirname, "factories", `orbit-${resourceKey}.lua`),
      factoryLua
    );
  }
);
