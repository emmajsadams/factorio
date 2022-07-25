
local resource_key = 'se-spaceship-antimatter-engine'
local required_resources =
{
  {'se-superconductive-cable', 100},  {'se-nanomaterial', 10},  {'se-naquium-cube', 4},  {'se-heavy-assembly', 10},  {'se-lattice-pressure-vessel', 10},  {'se-spaceship-ion-engine', 1},  {'se-heat-shielding', 100},
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
  