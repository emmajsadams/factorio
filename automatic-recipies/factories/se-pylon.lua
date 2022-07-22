
local resource_key = 'se-pylon'
local required_resources =
{
  {'se-holmium-cable', 64},  {'se-aeroframe-pole', 4},  {'concrete', 64},  {'se-beryllium-plate', 32},
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
  