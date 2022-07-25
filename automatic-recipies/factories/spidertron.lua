
local resource_key = 'spidertron'
local required_resources =
{
  {'low-density-structure', 150},  {'se-heavy-girder', 16},  {'rocket-control-unit', 16},  {'se-specimen', 1},  {'rocket-launcher', 4},  {'se-rtg-equipment', 8},  {'exoskeleton-equipment', 4},  {'radar', 2},
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
  