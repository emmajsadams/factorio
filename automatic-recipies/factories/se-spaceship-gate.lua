
local resource_key = 'se-spaceship-gate'
local required_resources =
{
  {'electric-engine-unit', 24},  {'se-aeroframe-bulkhead', 4},  {'se-spaceship-wall', 4},  {'se-heat-shielding', 4},
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
  