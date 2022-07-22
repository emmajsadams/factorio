
local resource_key = 'se-big-heat-exchanger'
local required_resources =
{
  {'se-nanomaterial', 40},  {'se-heavy-composite', 80},  {'se-lattice-pressure-vessel', 40},  {'se-space-pipe', 200},  {'se-heat-shielding', 200},
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
  