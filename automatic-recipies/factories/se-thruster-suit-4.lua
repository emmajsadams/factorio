
local resource_key = 'se-thruster-suit-4'
local required_resources =
{
  {'se-superconductive-cable', 100},  {'processing-unit', 200},  {'se-naquium-processor', 1},  {'se-nanomaterial', 200},  {'se-lattice-pressure-vessel', 1},  {'se-antimatter-canister', 10},  {'se-self-sealing-gel', 1},  {'se-naquium-plate', 100},  {'se-deep-catalogue-2', 1},  {'se-thruster-suit-3', 1},
}

if red[resource_key] >= 1 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end

for _, required_resource_tuple in ipairs(required_resources)
do
  local required_resource_key = required_resource_tuple[1]
  local required_resource_amount = required_resource_tuple[2]

  if red[resource_key] >= 1 then
    out[required_resource_key] = required_resource_amount
  else
    out[required_resource_key] = nil
  end
end
  