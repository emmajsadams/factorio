-- Channel: "Power Plant - Used Uranium Fuel Cell Provider"

out['ltn-network-id'] = 1
out['used-up-uranium-fuel-cell'] = green['used-up-uranium-fuel-cell']
out['ltn-provider-threshold'] = 400
out['ltn-max-trains'] = 1 -- only one train at a time
out['ltn-provider-priority'] = 50 -- nuclear power plant (50) -> solid fuel to depot (40) -> crude oil to base (30) -> uranium ore to base (20) -> omni fragments to base (10)
