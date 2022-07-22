
local resource_key = 'productivity-module-4'
local required_resources =
{
  {'productivity-module-3', 8},  {'se-vitamelange-extract', 480},  {'se-machine-learning-data', 4},
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
  