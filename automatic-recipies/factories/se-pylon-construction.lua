
local resource_key = 'se-pylon-construction'
local required_resources =
{
  {'se-holmium-solenoid', 4},  {'battery', 16},  {'processing-unit', 16},  {'se-heavy-girder', 4},  {'se-aeroframe-scaffold', 4},  {'se-pylon', 1},
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
  