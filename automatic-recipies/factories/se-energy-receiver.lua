
local resource_key = 'se-energy-receiver'
local required_resources =
{
  {'se-superconductive-cable', 80},  {'processing-unit', 200},  {'se-heavy-girder', 400},  {'se-aeroframe-bulkhead', 400},  {'glass', 4000},  {'se-heat-shielding', 400},  {'copper-plate', 4000},
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
  