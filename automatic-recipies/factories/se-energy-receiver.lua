
local resource_key = 'se-energy-receiver'
local required_resources =
{
  {'se-superconductive-cable', 20},  {'processing-unit', 50},  {'se-heavy-girder', 100},  {'se-aeroframe-bulkhead', 100},  {'glass', 1000},  {'se-heat-shielding', 100},  {'copper-plate', 1000},
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
  