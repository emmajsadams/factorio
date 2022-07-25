
local resource_key = 'se-nexus'
local required_resources =
{
  {'se-superconductive-cable', 20},  {'se-naquium-processor', 1},  {'se-naquium-tessaract', 20},  {'se-heavy-assembly', 10},  {'se-aeroframe-bulkhead', 10},
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
  