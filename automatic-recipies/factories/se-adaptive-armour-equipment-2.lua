
local resource_key = 'se-adaptive-armour-equipment-2'
local required_resources =
{
  {'processing-unit', 40},  {'low-density-structure', 40},  {'steel-plate', 120},  {'se-adaptive-armour-equipment-1', 4},
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
  