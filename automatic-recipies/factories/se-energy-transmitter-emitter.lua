
local resource_key = 'se-energy-transmitter-emitter'
local required_resources =
{
  {'se-superconductive-cable', 800},  {'processing-unit', 400},  {'se-heavy-girder', 800},  {'se-aeroframe-bulkhead', 400},  {'glass', 4000},
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
  