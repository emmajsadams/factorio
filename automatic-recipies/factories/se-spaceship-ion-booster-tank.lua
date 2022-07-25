
local resource_key = 'se-spaceship-ion-booster-tank'
local required_resources =
{
  {'electric-engine-unit', 4},  {'se-holmium-cable', 40},  {'se-holmium-solenoid', 8},  {'storage-tank', 1},  {'se-beryllium-plate', 10},
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
  