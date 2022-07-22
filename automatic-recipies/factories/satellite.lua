
local resource_key = 'satellite'
local required_resources =
{
  {'advanced-circuit', 200},  {'low-density-structure', 200},  {'solar-panel', 40},  {'accumulator', 40},  {'rocket-fuel', 200},  {'glass', 400},  {'radar', 4},
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
  