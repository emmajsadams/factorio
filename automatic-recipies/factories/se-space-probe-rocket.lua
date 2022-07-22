
local resource_key = 'se-space-probe-rocket'
local required_resources =
{
  {'se-holmium-solenoid', 20},  {'se-aeroframe-scaffold', 80},  {'se-cargo-rocket-section', 40},  {'rocket-fuel', 200},  {'se-iridium-plate', 200},
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
  