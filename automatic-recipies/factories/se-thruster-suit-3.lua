
local resource_key = 'se-thruster-suit-3'
local required_resources =
{
  {'se-superconductive-cable', 50},  {'processing-unit', 100},  {'se-aeroframe-bulkhead', 1},  {'rocket-fuel', 50},  {'se-astronomic-catalogue-1', 1},  {'se-biological-catalogue-1', 1},  {'se-energy-catalogue-3', 1},  {'se-material-catalogue-3', 1},  {'se-thruster-suit-2', 1},
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
  