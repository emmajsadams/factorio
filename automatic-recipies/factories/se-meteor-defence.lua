
local resource_key = 'se-meteor-defence'
local required_resources =
{
  {'copper-cable', 100},  {'battery', 50},  {'processing-unit', 100},  {'concrete', 100},  {'glass', 50},  {'steel-plate', 100},
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
  