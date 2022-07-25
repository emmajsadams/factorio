
local resource_key = 'fusion-reactor-equipment'
local required_resources =
{
  {'se-superconductive-cable', 50},  {'processing-unit', 200},  {'low-density-structure', 50},  {'se-heat-shielding', 50},  {'se-fusion-test-data', 50},
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
  