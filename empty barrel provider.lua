out['ltn-network-id'] = 1
out['ltn-max-trains'] = 1 -- only one train at a time

out['ltn-requester-priority'] = 30 -- solid fuel to depot (40) -> crude oil to base (30) -> uranium ore to base (20) -> omni fragments to base (10)

-- need about 1000 empty barrels to do stuff. at 500 we will request more
out['ltn-requester-threshold'] = 500
out['empty-barrel'] = green['empty-barrel'] - 1000
