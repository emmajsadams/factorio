
local resource_key = 'se-spaceship-antimatter-engine'
local required_resources =
{
  {'se-superconductive-cable', 400},  {'se-nanomaterial', 40},  {'se-naquium-cube', 16},  {'se-heavy-assembly', 40},  {'se-lattice-pressure-vessel', 40},  {'se-spaceship-ion-engine', 4},  {'se-heat-shielding', 400},
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
  