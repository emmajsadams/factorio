
local resource_key = 'se-thruster-suit-3'
local required_resources =
{
  {'se-superconductive-cable', 200},  {'processing-unit', 400},  {'se-aeroframe-bulkhead', 4},  {'rocket-fuel', 200},  {'se-astronomic-catalogue-1', 4},  {'se-biological-catalogue-1', 4},  {'se-energy-catalogue-3', 4},  {'se-material-catalogue-3', 4},  {'se-thruster-suit-2', 4},
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
  