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


    local default_amount = 1500
    local default_ore_amount = 15000
    local default_processed_good_amount = 1000
    local default_base_building_amount = 200
    local default_barrel_amount = 500
    local default_science_amount = 1000
    local resource_amounts =
    {
      {'empty-barrel', 500}, -- TODO: I need to rehook this factory up I unhooked it
      {'processed-fuel', 300}, -- TODO: is this even needed anymore for anything? I use rocket fuel now?
      {'sand', 4000},
      {'solid-fuel', 4000},
      {'battery', 2000},
      {'iron-plate', 25000},  -- common resource so bump it up
      {'steel-plate', 5000}, -- common resource so bump it up
      {'copper-plate', 25000},
      {'copper-cable', 10000},
      {'stone-brick', 4000},
      {'stone-tablet', 2000},
      {'glass', default_amount},
      {'iron-gear-wheel', 1000},
      {'motor', default_processed_good_amount},
      {'iron-stick', default_processed_good_amount},
      {'burner-inserter', default_processed_good_amount},
      {'electric-motor', default_processed_good_amount},
      {'inserter', default_processed_good_amount},
      {'engine-unit', default_processed_good_amount},
      {'electric-engine-unit', 120}, -- needed for satellite production so lets stockpile
      {'plastic-bar', default_processed_good_amount},
      {'sulfur', default_amount},
      {'firearm-magazine', default_amount},
      {'piercing-rounds-magazine', default_amount},
      {'grenade', default_amount},




      -- base management stuff (TODO audit other essential buildings)
      {'speed-module', default_processed_good_amount}, -- TODO: setup speed module 3 factory!
      {'transport-belt', default_processed_good_amount}, -- needed for fast

      -- TODO IMMEDAITELY setup core fragment processing! AND add buffer chests for combat robo ports
      -- TODO: NUCLEAR FUEL!!, setup rails, logistics train stops, moon computers, fast transport belts, pipes, storage tanks, nuclear fuel, offshore pumps,
      -- TODO: build the things I researched last night
      -- robot ports, area defense drones, electric mining drills, centifuges, pumpjacks, fuel refinery, chemical plant, meteor defense, meteor defense ammo, robotports, substations, big electric poles, heatpipes, heat exchangers, logistics chests
      -- stack inserters, stack filter inserters, programmable speakers, cargo wagons, trains, cliff explosives, tank missles, personal missles, life support facility, decontaimination facility, lab, green wire, red wire
      -- (NOTe also just insert a bunch of these after confirming it works to not fuck up production), signal transmitter and reciever
      -- TODO: make offset meteor defense base using LTN
      -- TODO (maybe probably a strech, much lower amount): core mining drill, cargo rocket silo, satetlite rocket silo

      -- TODO: Create more nuclear reactors since recharging meteor defense can be an issue (also force research the tech)

      {'flying-robot-frame', default_base_building_amount},
      {'accumulator', 20},
      {'solar-panel', 20},
      {'stone-furnace', default_base_building_amount},
      {'steel-furnace', default_base_building_amount},
      {'electric-furnace', default_base_building_amount},
      {'logistic-robot', default_base_building_amount},
      {'construction-robot', default_base_building_amount},
      {'laser-turret', default_base_building_amount}, -- TODO SET THIS UP
      {'repair-pack', default_base_building_amount}, -- TODO SET THIS UP
      {'burner-assembling-machine', default_base_building_amount}, -- needed for assembling-machine-2
      {'assembling-machine-1', default_base_building_amount}, -- needed for assembling-machine-2
      {'assembling-machine-2', default_base_building_amount},
      {'stone-wall', default_base_building_amount}, -- needed for steel wall
      {'concrete-wall', default_base_building_amount}, -- needed for steel wall
      {'steel-wall', default_base_building_amount},

      -- circuits
      {'electronic-circuit', 1000},
      {'advanced-circuit', 1000}, -- needed for satellite production so lets stockpile
      {'processing-unit', default_processed_good_amount},

      -- needed for satellite production
      {'rocket-fuel', 5000},
      {'se-heat-shielding', 500},
      {'low-density-structure', 500},
      {'concrete', default_amount},
      {'radar', 30},
      {'rocket-control-unit', 100},
      {'satellite', 10},

      -- ore amounts
      {'coal', default_ore_amount},
      {'iron-ore', default_ore_amount},
      {'copper-ore', default_ore_amount},
      {'stone', default_ore_amount},
      {'uranium-ore', default_ore_amount},

      -- barrels
      {'crude-oil-barrel', 0}, -- special case to avoid an infinite loop since I transport this from other places.. maybe reconsider?
      {'lubricant-barrel', default_barrel_amount},
      {'water-barrel', 1000},
      {'sulfuric-acid-barrel', default_barrel_amount},
      {'light-oil-barrel', default_barrel_amount},
      {'heavy-oil-barrel', default_barrel_amount},
      {'petroleum-gas-barrel', default_barrel_amount},

      -- science packs currently able to be produced
      {'automation-science-pack', default_science_amount},
      {'logistic-science-pack', default_science_amount},
      {'chemical-science-pack', default_science_amount},
      {'military-science-pack', default_science_amount},
      {'se-rocket-science-pack', default_science_amount},
    }


    -- be careful with this for power usage. but this will keep producing as long as there is inventory
    local infinte_resources = {
      -- 'iron-plate'
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
