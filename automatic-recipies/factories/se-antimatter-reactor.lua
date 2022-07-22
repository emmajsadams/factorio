
local resource_key = 'se-antimatter-reactor'
local required_resources =
{
  {'se-superconductive-cable', 2000},  {'processing-unit', 2000},  {'low-density-structure', 2000},  {'se-naquium-cube', 200},  {'se-heat-shielding', 2000},  {'se-energy-catalogue-4', 20},
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
  