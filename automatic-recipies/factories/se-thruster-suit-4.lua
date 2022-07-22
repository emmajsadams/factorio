
local resource_key = 'se-thruster-suit-4'
local required_resources =
{
  {'se-superconductive-cable', 400},  {'processing-unit', 800},  {'se-naquium-processor', 4},  {'se-nanomaterial', 800},  {'se-lattice-pressure-vessel', 4},  {'se-antimatter-canister', 40},  {'se-self-sealing-gel', 4},  {'se-naquium-plate', 400},  {'se-deep-catalogue-2', 4},  {'se-thruster-suit-3', 4},
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
  