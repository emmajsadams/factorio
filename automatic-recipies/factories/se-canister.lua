
local resource_key = 'se-canister'
local required_resources =
{
  {'plastic-bar', 20},  {'glass', 20},  {'se-heat-shielding', 4},  {'steel-plate', 20},  {'copper-plate', 40},
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
  