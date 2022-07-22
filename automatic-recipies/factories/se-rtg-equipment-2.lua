
local resource_key = 'se-rtg-equipment-2'
local required_resources =
{
  {'se-holmium-solenoid', 32},  {'processing-unit', 200},  {'low-density-structure', 400},  {'se-radiation-data', 4},  {'se-atomic-data', 4},  {'se-rtg-equipment', 16},
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
  