out['ltn-network-id'] = 1

-- we want to provide crude oil once we get to 300 barrels
out['crude-oil-barrel'] = green['crude-oil-barrel']

-- train currently has two wagons with 400 barrels each of space so lets request at 600 to leave some room for empty barreles
out['ltn-provider-threshold'] = 600


out['ltn-max-trains'] = 1 -- only one train at a time

-- TODO: centrally configure this from base using signal transmission
out['ltn-provider-priority'] = 30 -- solid fuel to depot (40) -> crude oil to base (30) -> uranium ore to base (20) -> omni fragments to base (10)




-- TODO: BREAK UP THE EMPTY BARREL AND OIL STOPS!! it fucks with the logic since it's waiting
-- out['ltn-requester-priority'] = 30 -- solid fuel to depot (40) -> crude oil to base (30) -> uranium ore to base (20) -> omni fragments to base (10)
-- need about 1000 empty barrels to do stuff. at 500 we will request more
-- out['ltn-requester-threshold'] = 500
-- out['empty-barrel'] = green['empty-barrel'] - 1000
