// TODO: Filter on "category" : "crafting", then template out the lua scripts
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

const defaultScienceAmount = 200;
const resourceRequirements: any = {
  "automation-science-pack": defaultScienceAmount,
  "logistic-science-pack": defaultScienceAmount,
  "chemical-science-pack": defaultScienceAmount,
  "military-science-pack": defaultScienceAmount,
  "se-rocket-science-pack": defaultScienceAmount,
  "sulfuric-acid-barrel": 1000,
};

// { name: [{name, amount}]}
const ingredientFactories: any = {};

// electronic-circuit refers to the wood one, we want stone
const blacklist: any = ["loader", "distractor-capsule", "electronic-circuit"];

const multiplier: any = {
  "electronic-circuit": 6,
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

    const name = handleWeirdNames(anyIngredient["name"]);
    let amount = anyIngredient["amount"];
    const type = anyIngredient["type"];

    if (type != "item") {
      throw new Error("should never happen");
    }

    if (multiplier[recipeName]) {
      amount = multiplier[recipeName] * amount;
    }

    if (!resourceRequirements[name]) {
      resourceRequirements[name] = 0;
    }

    // maybe multiple amount by two or three to keep an extra stockpile?
    resourceRequirements[name] += amount;

    ingredientFactories[recipeName].push({ name, amount });
  });
});

// // This should never hapen but it does somehow....
// if (ingredientFactories["electronic-circuit-stone"]) {
//   ingredientFactories["electronic-circuit"] =
//     ingredientFactories["electronic-circuit-stone"];
// }

// quick and dirty override for solid-fuel
resourceRequirements["solid-fuel"] = 200;

let lua_body = "";
Object.entries(resourceRequirements).forEach(
  ([resourceKey, resourceAmount]) => {
    lua_body += `  {'${resourceKey}', ${resourceAmount}},`;
  }
);

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
    local infinte_resources = {
      'copper-plate'
    }

    -- basically if the output of one of these blocks the other then we need to treat all as needed if any one of them is needed. this check is done after the main needs production check
    -- to avoid any sort of infinite loop
    local grouped_outputs = {
      -- no longer an issue now that I have separate storage tanks for each fuel!
      -- {'light-oil-barrel', 'heavy-oil-barrel', 'petroleum-gas-barrel'}
    }

    -- any resource that should alert if below a certain threshold
    local critical_resources = {
      {'iron-plate', 3000},
      {'solid-fuel', 200},
      {'uranium-fuel-cell', 500}
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

    -- set flag that an alert should be signaled
    local sound_alarm = false
    for _, critical_resources_tuple in ipairs(critical_resources)
    do
      local critical_resources_key = critical_resources_tuple[1]
      local critical_resources_amount = critical_resources_tuple[2]
      if green[critical_resources_key] <= critical_resources_amount then
        sound_alarm = true
      end
    end

  -- TODO TEMP DISABLE
  -- sound_alarm = false

  -- TODO make this so the alarm stops and only repeats every few minutes
  if sound_alarm then
    out['signal-info'] = 2
  else
    out['signal-info'] = nil
  end

  out['assembling-machine'] = nil
`;
fs.writeFileSync(path.join(__dirname, "centralCommand.lua"), centralCommandLua);

console.log(ingredientFactories);
Object.entries(ingredientFactories).forEach(([resourceKey, ingredients]) => {
  const anyIngredients = ingredients as any;

  let factoryRequiredResources = "";
  for (const ingredient of anyIngredients) {
    const anyIngredient: any = ingredient as any;
    // TODO: should I times two or anything like that? that way it has a buffer? going to times 4 naively
    factoryRequiredResources += `  {'${anyIngredient.name}', ${
      anyIngredient.amount * 4
    }},`;
  }

  const factoryLua = `
local resource_key = '${resourceKey}'
local required_resources =
{
${factoryRequiredResources}
}

for _, required_resource_tuple in ipairs(required_resources)
do
  local required_resource_key = required_resource_tuple[1]
  local required_resource_amount = required_resource_tuple[2]

  if red[resource_key] >= 1 then
    out[required_resource_key] = required_resource_amount
    out['signal-info'] = 1
  else
    out[required_resource_key] = nil
    out['signal-info'] = 2
  end
end
  `;
  fs.writeFileSync(
    path.join(__dirname, "factories", `${resourceKey}.lua`),
    factoryLua
  );
});
