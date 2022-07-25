
local resource_key = 'area-mining-drill'
local required_resources =
{
  {'electric-engine-unit', 8},  {'processing-unit', 4},  {'electric-mining-drill', 1},  {'steel-plate', 20},
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
  