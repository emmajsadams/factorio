-- Channel: "Power Plant - Uranium Fuel Cell Request"

-- We want 20 of each essential resource. At 10 we request more

out['ltn-network-id'] = 1
out['ltn-max-trains'] = 1 -- only one train at a time
out['ltn-requester-priority'] = 50 -- nuclear fuel cells to power plant (50) -> solid fuel to depot (40) -> crude oil to base (30) -> uranium ore to base (20) -> omni fragments to base (10)
out['ltn-requester-threshold'] = 10
out['uranium-fuel-cell'] = green['uranium-fuel-cell'] - 1000
