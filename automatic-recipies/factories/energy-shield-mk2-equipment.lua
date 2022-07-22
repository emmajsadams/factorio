
local resource_key = 'energy-shield-mk2-equipment'
local required_resources =
{
  {'se-holmium-solenoid', 40},  {'processing-unit', 20},  {'low-density-structure', 20},  {'se-iridium-plate', 40},  {'se-forcefield-data', 20},  {'energy-shield-equipment', 20},
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
  