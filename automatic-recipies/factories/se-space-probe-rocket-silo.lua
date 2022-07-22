
local resource_key = 'se-space-probe-rocket-silo'
local required_resources =
{
  {'electric-engine-unit', 800},  {'se-holmium-cable', 800},  {'processing-unit', 800},  {'se-heavy-girder', 400},  {'se-aeroframe-scaffold', 400},  {'se-heat-shielding', 800},
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
  