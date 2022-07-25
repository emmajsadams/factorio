
local resource_key = 'se-pylon-construction-radar'
local required_resources =
{
  {'battery', 16},  {'se-quantum-processor', 4},  {'se-heavy-bearing', 4},  {'se-aeroframe-bulkhead', 4},  {'se-pylon-construction', 1},  {'radar', 1},
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
  