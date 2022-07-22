
local resource_key = 'spidertron'
local required_resources =
{
  {'low-density-structure', 600},  {'se-heavy-girder', 64},  {'rocket-control-unit', 64},  {'se-specimen', 4},  {'rocket-launcher', 16},  {'se-rtg-equipment', 32},  {'exoskeleton-equipment', 16},  {'radar', 8},
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
  