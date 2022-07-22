local provided_resource = 'se-core-fragment-omni'

out['ltn-network-id'] = 1
out[provided_resource] = green[provided_resource]
out['ltn-provider-threshold'] = 5000
out['ltn-max-trains'] = 1 -- only one train at a time

-- TODO: centrally configure this from base using signal transmission
out['ltn-provider-priority'] = 10 -- solid fuel to depot (40) -> crude oil to base (30) -> uranium ore to base (20) -> omni fragments to base (10)

-- TODO: change warehouse to active provider so then I can scale storage
