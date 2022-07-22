
local resource_key = 'centrifuge'
local required_resources =
{
  {'electric-engine-unit', 80},  {'processing-unit', 80},  {'concrete', 400},  {'se-heat-shielding', 80},  {'steel-plate', 200},
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
  