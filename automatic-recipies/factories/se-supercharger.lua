
local resource_key = 'se-supercharger'
local required_resources =
{
  {'se-holmium-cable', 64},  {'se-holmium-solenoid', 64},  {'battery', 64},  {'se-heavy-girder', 16},  {'se-aeroframe-scaffold', 16},
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
  