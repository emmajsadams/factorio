
local resource_key = 'se-space-probe-rocket'
local required_resources =
{
  {'se-holmium-solenoid', 5},  {'se-aeroframe-scaffold', 20},  {'se-cargo-rocket-section', 10},  {'rocket-fuel', 50},  {'se-iridium-plate', 50},
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
  