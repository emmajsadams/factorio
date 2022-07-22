
local resource_key = 'se-meteor-defence'
local required_resources =
{
  {'copper-cable', 400},  {'battery', 200},  {'processing-unit', 400},  {'concrete', 400},  {'glass', 200},  {'steel-plate', 400},
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
  