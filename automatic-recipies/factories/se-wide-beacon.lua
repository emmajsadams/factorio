
local resource_key = 'se-wide-beacon'
local required_resources =
{
  {'se-holmium-cable', 800},  {'se-holmium-solenoid', 8},  {'processing-unit', 240},  {'low-density-structure', 240},  {'beacon', 4},  {'se-energy-catalogue-1', 4},
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
  