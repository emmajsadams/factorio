
local resource_key = 'se-cargo-rocket-section-beryllium'
local required_resources =
{
  {'low-density-structure', 16},  {'rocket-control-unit', 16},  {'se-cargo-rocket-cargo-pod', 4},  {'se-cargo-rocket-fuel-tank', 4},  {'se-heat-shielding', 16},  {'se-beryllium-plate', 32},
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
  