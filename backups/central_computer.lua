-- TODO!! CRITICAL!!! redesign factories to use new design that stops requesting when production should stop and sends ingridents to active provider
-- TODO: Remove all the green wires since I can just use roboport to get logistics inventory
-- TODO: use mod output of receipies to determine the overall inventory I want to stockpile and how much of each ingrident to request for any given receipie. can mass generate everything!
-- TODO: create a new LTN provider and requester blueprint to generically reuse. for the provider use requester/active provider, and script to ensure that exactly how much can be carried in a train is ready to go (and maybe double for things like core fragment shipments that happen often)
-- TODO: Design new empty barrel and fill barrel factory that requests way more and uses warehouses!
-- TODO: massively scale up urannum mining. get another outpost. put drills everywhere at current one
-- TODO: finish emptying light oil barrels! just burned a bunch to create rocket fuel

-- REST OF TODOS ARE OUTDATED

-- TODO: reorganize storage in a clear way to make sure everything is wired. Also hunt down any storage units idiling and massively reduce robo port coverage area in main base (stone, copper, iron can become train stops and I have a ton already)
  -- (bascially don't include the buffer or active provider chests in the count, JUST storage since it fucks with how it all works. I may need to lower the counts after this change)
-- TODO: decommission power plants at base
-- TODO: move central power generation away from base, easy to send power back over wires and can supplly uraninum via burn

-- TOOOOOODO: change it so all filters work on GREATER than one. Then use numbers greater than one for specific things.
    -- EX: 2 == Resource is below a dangerous threshold. then trigger an alarm
    -- TODO: Actually setup logistics train network since I now have everything for it!!
      -- then stop using drones to transmit copper and stone!!
    -- TODO: meteor defense
    -- TODO: combat roboport coverage
    -- TODO: uraninum ore mining (include sulfuric acid wagon bascially)
    -- TODO: have a cargo wagon just for fuel on train maybe??
    -- TODO: Add double check for duplicate keys in amountss
    -- TODO: Create extra special alert for uraninum fuel cell loss
    -- TODO: add a cargo for fuel, then drop some off at each train stop and use logistics to insert it back in
    -- TODO: build fluid warehouses since barrels are ineffienct. basically scale up and down barrel production
    -- TODO: improve radar coverage
    -- TODO! Massively scale up iron production. being constrained by ore....
    -- TODO: add a general check for any resouce being very large (maybe like 100 by default, plus 3000 if defined in the config)
    -- TODO: set an alert for no mining happening when ore should be produduced
    -- TODO: set alert for no production happening for X minutes when production should be happening
    -- TODO: set production dynamically based on if the rate is going down or up!
    -- TODO: START CORE MINING!!! need resources
    -- TODO: Debug why its showign the wrong amount
    -- TODO: Double check that I have wired everything correctly, one mistake fucks up the whole production line
    -- TODO: Wire up crude oil factility to stop producing oil if not needed (already refactored for robo production)
    -- TODO: force research uraninum stuff and rest of logistics so I can start that prouduction and clean up inventory
    -- NOTE: using drones alot uses tons of power, make sure to find ways to minimize usage
    -- TODO: setup an alarm if any critical science component stops producing when under limit!!
    -- TODO: setup alarms on water pumps to power stataion
    -- TODO: setup alarms on power usage limits
    -- TODO: refactor external mining setups to allow for repair storage? since right now it fucks with the external barrel logic (basically use ltn)
    -- TODO: move solid oil production to a fluid setup since it's getting bottleneckedh hardcore
    -- TODO: alarm if all labs have been inactive for more than 2 minutes
    -- TODO: build LTN stops for all key resources to keep mining outposts secure (laser turrets, walls, roboports, chests, belts, etc....)
    -- TODO: finish recycling all the old stuff!
    -- TODO: actually setup some accumulators
    -- TODO: fix cricitcal resource low alert!







local resource_amounts =
{
  {'automation-science-pack', 200},  {'logistic-science-pack', 200},  {'chemical-science-pack', 200},  {'military-science-pack', 200},  {'se-rocket-science-pack', 200},  {'sulfuric-acid-barrel', 1000},  {'copper-plate', 2187},  {'electronic-circuit', 820},  {'stone-brick', 208},  {'iron-gear-wheel', 386},  {'electric-motor', 209},  {'stone-furnace', 5},  {'se-superconductive-cable', 1377},  {'processing-unit', 3644},  {'se-heavy-girder', 1295},  {'se-aeroframe-bulkhead', 372},  {'glass', 2923},  {'concrete', 4803},  {'steel-plate', 5010},  {'electric-engine-unit', 814},  {'advanced-circuit', 742},  {'pipe', 476},  {'raw-fish', 5},  {'wood', 24},  {'iron-plate', 401},  {'low-density-structure', 1448},  {'solar-panel', 61},  {'accumulator', 60},  {'rocket-fuel', 310},  {'radar', 29},  {'se-aeroframe-pole', 2266},  {'se-astronomic-catalogue-3', 1},  {'coal', 33},  {'se-holmium-cable', 1641},  {'se-aeroframe-scaffold', 149},  {'se-heat-shielding', 1481},  {'se-copper-ingot', 1},  {'se-iron-ingot', 1},  {'se-spaceship-wall', 1},  {'se-iridium-ingot', 1},  {'se-space-pipe', 157},  {'storage-tank', 25},  {'se-beryllium-ingot', 1},  {'se-holmium-ingot', 1},  {'se-heavy-bearing', 245},  {'se-naquium-ingot', 1},  {'se-holmium-solenoid', 186},  {'se-spaceship-rocket-engine', 1},  {'se-beryllium-plate', 36},  {'se-nanomaterial', 304},  {'se-naquium-cube', 109},  {'se-heavy-assembly', 30},  {'se-lattice-pressure-vessel', 41},  {'se-spaceship-ion-engine', 1},  {'se-spaceship-rocket-booster-tank', 1},  {'motor', 28},  {'burner-assembling-machine', 1},  {'firearm-magazine', 1},  {'uranium-238', 27},  {'piercing-rounds-magazine', 7},  {'iron-stick', 34},  {'uranium-fuel-cell', 4},  {'se-radiation-data', 1},  {'se-atomic-data', 1},  {'se-rtg-equipment', 12},  {'se-fusion-test-data', 50},  {'copper-cable', 212},  {'small-iron-electric-pole', 1},  {'explosives', 150},  {'grenade', 8},  {'burner-mining-drill', 1},  {'electric-mining-drill', 41},  {'flying-robot-frame', 2},  {'solid-fuel', 10},  {'speed-module', 6},  {'speed-module-2', 27},  {'speed-module-3', 42},  {'se-iridium-plate', 263},  {'se-machine-learning-data', 3},  {'speed-module-4', 2},  {'se-material-catalogue-1', 2},  {'speed-module-5', 2},  {'se-material-catalogue-2', 2},  {'se-heavy-composite', 246},  {'speed-module-6', 2},  {'se-material-catalogue-3', 5},  {'stone', 61},  {'stone-wall', 2},  {'concrete-wall', 1},  {'train-stop', 1},  {'small-lamp', 22},  {'red-wire', 2},  {'green-wire', 2},  {'constant-combinator', 1},  {'engine-unit', 121},  {'transport-belt', 10},  {'plastic-bar', 33},  {'steel-chest', 45},  {'battery', 506},  {'se-naquium-processor', 22},  {'se-naquium-tessaract', 35},  {'se-steel-ingot', 1},  {'laser-turret', 21},  {'assembling-machine-1', 1},  {'jetpack-1', 3},  {'jetpack-2', 2},  {'effectivity-module-3', 42},  {'jetpack-3', 2},  {'battery-equipment', 10},  {'refined-concrete', 1010},  {'light-armor', 1},  {'burner-inserter', 1},  {'car', 1},  {'car-vehicle-machine-gun', 1},  {'tank', 3},  {'tank-tank-cannon', 1},  {'tank-tank-flamethrower', 1},  {'tank-tank-machine-gun', 1},  {'rocket-control-unit', 145},  {'se-specimen', 1},  {'rocket-launcher', 4},  {'exoskeleton-equipment', 4},  {'spidertron', 1},  {'spidertron-spidertron-rocket-launcher-1', 1},  {'recycling-machine-1', 1},  {'se-electromagnetic-field-data', 5},  {'se-forcefield-data', 5},  {'energy-shield-equipment', 5},  {'se-quantum-processor', 146},  {'se-superconductivity-data', 10},  {'energy-shield-mk2-equipment', 5},  {'energy-shield-mk3-equipment', 5},  {'se-dynamic-emitter', 81},  {'se-magnetic-monopole-data', 50},  {'energy-shield-mk4-equipment', 5},  {'se-antimatter-canister', 60},  {'energy-shield-mk5-equipment', 5},  {'shotgun-shell', 2},  {'aai-strongbox', 5},  {'aai-storehouse', 5},  {'aai-warehouse', 5},  {'roboport', 1},  {'underground-belt', 2},  {'assembling-machine-2', 2},  {'arithmetic-combinator', 4},  {'decider-combinator', 2},  {'effectivity-module', 2},  {'effectivity-module-2', 27},  {'se-cryonite-rod', 31},  {'se-holmium-plate', 90},  {'effectivity-module-4', 2},  {'se-energy-catalogue-1', 3},  {'effectivity-module-5', 2},  {'se-energy-catalogue-2', 2},  {'effectivity-module-6', 2},  {'se-energy-catalogue-3', 5},  {'steel-furnace', 1},  {'electric-furnace', 1},  {'inserter', 2},  {'heavy-armor', 1},  {'productivity-module', 2},  {'sulfur', 64},  {'productivity-module-2', 2},  {'se-vulcanite-block', 51},  {'productivity-module-3', 2},  {'se-vitamelange-extract', 120},  {'se-bioscrubber', 50},  {'productivity-module-4', 2},  {'se-biological-catalogue-1', 2},  {'productivity-module-5', 2},  {'se-vitalic-reagent', 140},  {'se-biological-catalogue-2', 2},  {'productivity-module-6', 2},  {'se-vitalic-epoxy', 160},  {'se-biological-catalogue-3', 4},  {'recycling-machine-2', 2},  {'splitter', 1},  {'se-adaptive-armour-equipment-1', 1},  {'se-adaptive-armour-equipment-2', 1},  {'se-adaptive-armour-equipment-3', 1},  {'se-adaptive-armour-equipment-4', 1},  {'se-space-capsule-scorched', 1},  {'repair-pack', 25},  {'cannon-shell', 1},  {'empty-barrel', 1},  {'pistol', 2},  {'explosive-cannon-shell', 5},  {'modular-armor', 1},  {'rocket', 1},  {'uranium-235', 101},  {'stone-tablet', 25},  {'fast-inserter', 4},  {'power-armor', 1},  {'personal-roboport-equipment', 5},  {'se-energy-catalogue-4', 5},  {'defenderplus', 1},  {'defenderplus-defender-gun', 1},  {'solar-panel-equipment', 2},  {'destroyerplus', 1},  {'destroyerplus-destroyer-gun', 1},  {'slowdown-capsule', 3},  {'distractorplus', 1},  {'distractorplus-distractor-gun', 1},  {'se-naquium-plate', 104},  {'se-naquium-heat-pipe', 9},  {'steam-turbine', 1},  {'burner-lab', 1},  {'stack-inserter', 1},  {'iron-chest', 18},  {'pump', 2},  {'se-cargo-rocket-cargo-pod', 2},  {'se-cargo-rocket-fuel-tank', 2},  {'se-cargo-rocket-section-packed', 1},  {'se-cargo-rocket-section', 15},  {'se-lifesupport-equipment-1', 1},  {'se-thruster-suit', 1},  {'se-astronomic-catalogue-1', 1},  {'se-thruster-suit-2', 1},  {'se-self-sealing-gel', 1},  {'se-deep-catalogue-2', 1},  {'se-thruster-suit-3', 1},  {'sand', 200},  {'beacon', 2},  {'se-compact-beacon', 1},  {'se-deep-catalogue-1', 2},  {'se-wide-beacon', 1},  {'se-pylon', 2},  {'se-pylon-construction', 1},  {'se-deep-space-transport-belt-black', 70},  {'se-deep-space-splitter-black', 7},  {'se-deep-space-underground-belt-black', 14},
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
