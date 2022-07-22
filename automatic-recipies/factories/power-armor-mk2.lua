
local resource_key = 'power-armor-mk2'
local required_resources =
{
  {'electric-engine-unit', 160},  {'processing-unit', 240},  {'low-density-structure', 120},  {'speed-module-2', 100},  {'effectivity-module-2', 100},  {'power-armor', 4},
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
  