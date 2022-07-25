
local resource_key = 'se-space-elevator'
local required_resources =
{
  {'se-holmium-cable', 500},  {'processing-unit', 500},  {'se-heavy-girder', 500},  {'se-heavy-bearing', 100},  {'se-aeroframe-pole', 2000},  {'refined-concrete', 1000},
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
  