
local resource_key = 'effectivity-module-3'
local required_resources =
{
  {'processing-unit', 60},  {'effectivity-module-2', 8},  {'se-cryonite-rod', 120},
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
  