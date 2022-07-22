
local resource_key = 'se-energy-transmitter-chamber'
local required_resources =
{
  {'se-superconductive-cable', 200},  {'se-heavy-girder', 200},  {'se-aeroframe-bulkhead', 200},  {'glass', 400},
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
  