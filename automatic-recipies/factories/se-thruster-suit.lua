
local resource_key = 'se-thruster-suit'
local required_resources =
{
  {'low-density-structure', 20},  {'rocket-control-unit', 10},  {'glass', 20},  {'se-heat-shielding', 20},  {'jetpack-1', 1},  {'se-lifesupport-equipment-1', 1},
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
  