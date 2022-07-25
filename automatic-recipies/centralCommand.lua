
local resource_amounts =
{
  {'copper-plate', 2486},
  {'stone-brick', 5000},
  {'iron-gear-wheel', 389},
  {'electric-motor', 215},
  {'stone-furnace', 5},
  {'se-superconductive-cable', 1377},
  {'processing-unit', 100},
  {'se-heavy-girder', 1295},
  {'se-aeroframe-bulkhead', 372},
  {'glass', 2923},
  {'concrete', 4803},
  {'steel-plate', 5023},
  {'electric-engine-unit', 814},
  {'advanced-circuit', 1000},
  {'pipe', 482},
  {'raw-fish', 5},
  {'wood', 23},
  {'iron-plate', 531},
  {'low-density-structure', 1448},
  {'solar-panel', 61},
  {'accumulator', 60},
  {'rocket-fuel', 1000},
  {'radar', 29},
  {'se-aeroframe-pole', 2266},
  {'se-astronomic-catalogue-3', 1},
  {'coal', 33},
  {'se-holmium-cable', 1641},
  {'se-aeroframe-scaffold', 149},
  {'se-heat-shielding', 1481},
  {'se-copper-ingot', 1},
  {'se-iron-ingot', 1},
  {'se-spaceship-wall', 1},
  {'se-iridium-ingot', 1},
  {'se-space-pipe', 157},
  {'storage-tank', 50},
  {'se-beryllium-ingot', 1},
  {'se-holmium-ingot', 1},
  {'se-heavy-bearing', 245},
  {'se-naquium-ingot', 1},
  {'se-holmium-solenoid', 186},
  {'se-spaceship-rocket-engine', 1},
  {'se-beryllium-plate', 36},
  {'se-nanomaterial', 304},
  {'se-naquium-cube', 109},
  {'se-heavy-assembly', 30},
  {'se-lattice-pressure-vessel', 41},
  {'se-spaceship-ion-engine', 1},
  {'se-spaceship-rocket-booster-tank', 1},
  {'motor', 28},
  {'burner-assembling-machine', 1},
  {'firearm-magazine', 1},
  {'uranium-238', 27},
  {'piercing-rounds-magazine', 7},
  {'iron-stick', 34},
  {'uranium-fuel-cell', 4},
  {'se-radiation-data', 1},
  {'se-atomic-data', 1},
  {'se-rtg-equipment', 12},
  {'se-fusion-test-data', 50},
  {'copper-cable', 1000},
  {'small-iron-electric-pole', 1},
  {'explosives', 1000},
  {'grenade', 8},
  {'burner-mining-drill', 1},
  {'electric-mining-drill', 41},
  {'flying-robot-frame', 2},
  {'solid-fuel', 500},
  {'speed-module', 6},
  {'speed-module-2', 27},
  {'speed-module-3', 42},
  {'se-iridium-plate', 263},
  {'se-machine-learning-data', 3},
  {'speed-module-4', 2},
  {'se-material-catalogue-1', 2},
  {'speed-module-5', 2},
  {'se-material-catalogue-2', 2},
  {'se-heavy-composite', 246},
  {'speed-module-6', 2},
  {'se-material-catalogue-3', 5},
  {'stone', 61},
  {'stone-wall', 2},
  {'concrete-wall', 1},
  {'train-stop', 1},
  {'small-lamp', 22},
  {'red-wire', 2},
  {'green-wire', 2},
  {'constant-combinator', 1},
  {'engine-unit', 121},
  {'transport-belt', 10},
  {'plastic-bar', 500},
  {'steel-chest', 45},
  {'battery', 506},
  {'se-naquium-processor', 22},
  {'se-naquium-tessaract', 35},
  {'se-steel-ingot', 1},
  {'laser-turret', 21},
  {'assembling-machine-1', 1},
  {'jetpack-1', 3},
  {'jetpack-2', 2},
  {'effectivity-module-3', 42},
  {'jetpack-3', 2},
  {'battery-equipment', 10},
  {'refined-concrete', 1010},
  {'light-armor', 1},
  {'burner-inserter', 1},
  {'car', 1},
  {'car-vehicle-machine-gun', 1},
  {'tank', 3},
  {'tank-tank-cannon', 1},
  {'tank-tank-flamethrower', 1},
  {'tank-tank-machine-gun', 1},
  {'rocket-control-unit', 145},
  {'se-specimen', 1},
  {'rocket-launcher', 4},
  {'exoskeleton-equipment', 4},
  {'spidertron', 1},
  {'spidertron-spidertron-rocket-launcher-1', 1},
  {'recycling-machine-1', 1},
  {'se-electromagnetic-field-data', 5},
  {'se-forcefield-data', 5},
  {'energy-shield-equipment', 5},
  {'se-quantum-processor', 146},
  {'se-superconductivity-data', 10},
  {'energy-shield-mk2-equipment', 5},
  {'energy-shield-mk3-equipment', 5},
  {'se-dynamic-emitter', 81},
  {'se-magnetic-monopole-data', 50},
  {'energy-shield-mk4-equipment', 5},
  {'se-antimatter-canister', 60},
  {'energy-shield-mk5-equipment', 5},
  {'shotgun-shell', 2},
  {'aai-strongbox', 5},
  {'aai-storehouse', 5},
  {'aai-warehouse', 5},
  {'roboport', 1},
  {'underground-belt', 2},
  {'assembling-machine-2', 2},
  {'arithmetic-combinator', 4},
  {'decider-combinator', 2},
  {'effectivity-module', 2},
  {'effectivity-module-2', 27},
  {'se-cryonite-rod', 31},
  {'se-holmium-plate', 90},
  {'effectivity-module-4', 2},
  {'se-energy-catalogue-1', 3},
  {'effectivity-module-5', 2},
  {'se-energy-catalogue-2', 2},
  {'effectivity-module-6', 2},
  {'se-energy-catalogue-3', 5},
  {'steel-furnace', 1},
  {'electric-furnace', 1},
  {'inserter', 11},
  {'heavy-armor', 1},
  {'productivity-module', 2},
  {'sulfur', 500},
  {'productivity-module-2', 2},
  {'se-vulcanite-block', 51},
  {'productivity-module-3', 2},
  {'se-vitamelange-extract', 120},
  {'se-bioscrubber', 50},
  {'productivity-module-4', 2},
  {'se-biological-catalogue-1', 2},
  {'productivity-module-5', 2},
  {'se-vitalic-reagent', 140},
  {'se-biological-catalogue-2', 2},
  {'productivity-module-6', 2},
  {'se-vitalic-epoxy', 160},
  {'se-biological-catalogue-3', 4},
  {'recycling-machine-2', 2},
  {'splitter', 1},
  {'se-adaptive-armour-equipment-1', 1},
  {'se-adaptive-armour-equipment-2', 1},
  {'se-adaptive-armour-equipment-3', 1},
  {'se-adaptive-armour-equipment-4', 1},
  {'se-space-capsule-scorched', 1},
  {'repair-pack', 25},
  {'cannon-shell', 1},
  {'empty-barrel', 3000},
  {'pistol', 2},
  {'explosive-cannon-shell', 5},
  {'modular-armor', 1},
  {'rocket', 1},
  {'uranium-235', 101},
  {'stone-tablet', 1000},
  {'fast-inserter', 200},
  {'power-armor', 1},
  {'personal-roboport-equipment', 5},
  {'se-energy-catalogue-4', 5},
  {'defenderplus', 1},
  {'defenderplus-defender-gun', 1},
  {'solar-panel-equipment', 2},
  {'destroyerplus', 1},
  {'destroyerplus-destroyer-gun', 1},
  {'slowdown-capsule', 3},
  {'distractorplus', 1},
  {'distractorplus-distractor-gun', 1},
  {'se-naquium-plate', 104},
  {'se-naquium-heat-pipe', 9},
  {'steam-turbine', 1},
  {'burner-lab', 1},
  {'stack-inserter', 1},
  {'iron-chest', 18},
  {'pump', 100},
  {'se-cargo-rocket-cargo-pod', 10},
  {'se-cargo-rocket-fuel-tank', 10},
  {'se-cargo-rocket-section-packed', 1},
  {'se-cargo-rocket-section', 400},
  {'se-lifesupport-equipment-1', 1},
  {'se-thruster-suit', 1},
  {'se-astronomic-catalogue-1', 1},
  {'se-thruster-suit-2', 1},
  {'se-self-sealing-gel', 1},
  {'se-deep-catalogue-2', 1},
  {'se-thruster-suit-3', 1},
  {'sand', 5000},
  {'beacon', 2},
  {'se-compact-beacon', 1},
  {'se-deep-catalogue-1', 2},
  {'se-wide-beacon', 1},
  {'se-pylon', 2},
  {'se-pylon-construction', 1},
  {'se-deep-space-transport-belt-black', 70},
  {'se-deep-space-splitter-black', 7},
  {'se-deep-space-underground-belt-black', 14},
  {'sulfuric-acid-barrel', 1000},
  {'crude-oil-barrel', 1000},
  {'water-barrel', 1000},
  {'heavy-oil-barrel', 1000},
  {'light-oil-barrel', 1000},
  {'lubricant-barrel', 1000},
  {'petroleum-gas-barrel', 1000},
  {'se-pyroflux-barrel', 1000},
  {'se-liquid-rocket-fuel-barrel', 1000},
  {'chemical-science-pack', 2000},
  {'se-rocket-science-pack', 2000},
  {'logistic-science-pack', 2000},
  {'automation-science-pack', 2000},
  {'military-science-pack', 2000},
  {'se-delivery-cannon-capsule', 1000},
  {'logistic-robot', 500},
  {'construction-robot', 500},
  {'electronic-circuit', 1000},

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


out['se-cargo-rocket-fuel-tank'] = 1 -- TODO: FOR SOME REASON THIS IS NECESSARY!!!! ITS JUST NOT PRODUCING???
