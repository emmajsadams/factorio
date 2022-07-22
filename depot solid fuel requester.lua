out['ltn-network-id'] = 1

-- need about 1000 empty barrels to do stuff. at 500 we will request more
out['ltn-requester-threshold'] = 100
out['solid-fuel'] = green['solid-fuel'] - 200

-- TODO: move depot way away from main base then request fuel to it that way its out of my main base

-- TODO: centrally configure this from base using signal transmission
out['ltn-requester-priority'] = 40 -- solid fuel to depot (40) -> crude oil to base (30) -> uranium ore to base (20) -> omni fragments to base (10)

