
local resource_key = 'se-wide-beacon-2'
local required_resources =
{
  {'se-superconductive-cable', 40},  {'se-dynamic-emitter', 40},  {'se-naquium-tessaract', 40},  {'se-wide-beacon', 4},  {'se-deep-catalogue-1', 4},
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
  