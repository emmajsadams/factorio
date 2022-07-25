
local resource_key = 'se-compact-beacon'
local required_resources =
{
  {'se-holmium-cable', 100},  {'se-holmium-solenoid', 1},  {'processing-unit', 30},  {'low-density-structure', 30},  {'beacon', 1},  {'se-energy-catalogue-1', 1},
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
  