
local resource_key = 'se-thruster-suit-2'
local required_resources =
{
  {'processing-unit', 200},  {'rocket-fuel', 200},  {'se-iridium-plate', 200},  {'se-material-catalogue-1', 4},  {'se-thruster-suit', 4},
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
  