
local resource_key = 'se-space-elevator'
local required_resources =
{
  {'se-holmium-cable', 2000},  {'processing-unit', 2000},  {'se-heavy-girder', 2000},  {'se-heavy-bearing', 400},  {'se-aeroframe-pole', 8000},  {'refined-concrete', 4000},
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
  