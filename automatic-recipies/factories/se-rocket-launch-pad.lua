
local resource_key = 'se-rocket-launch-pad'
local required_resources =
{
  {'electric-engine-unit', 800},  {'processing-unit', 800},  {'steel-chest', 40},  {'pipe', 400},  {'storage-tank', 40},  {'concrete', 4000},  {'steel-plate', 4000},  {'radar', 40},
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
  