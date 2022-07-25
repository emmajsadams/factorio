
local resource_key = 'se-delivery-cannon'
local required_resources =
{
  {'electric-engine-unit', 10},  {'steel-chest', 10},  {'pipe', 10},  {'concrete', 20},  {'se-heat-shielding', 10},
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
  