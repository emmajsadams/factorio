
local resource_key = 'energy-shield-mk5-equipment'
local required_resources =
{
  {'se-dynamic-emitter', 50},  {'se-nanomaterial', 50},  {'se-magnetic-monopole-data', 50},  {'energy-shield-mk4-equipment', 5},
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
  