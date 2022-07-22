
local resource_key = 'se-pylon-construction-radar'
local required_resources =
{
  {'battery', 64},  {'se-quantum-processor', 16},  {'se-heavy-bearing', 16},  {'se-aeroframe-bulkhead', 16},  {'se-pylon-construction', 4},  {'radar', 4},
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
  