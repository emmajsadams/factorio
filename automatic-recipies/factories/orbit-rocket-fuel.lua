
local resource_key = 'rocket-fuel'
local required_resources =
{
{ 'rocket-fuel', 50 },
{ 'se-delivery-cannon-capsule', 2 },
}

-- for now we just keep sending it
out['signal-info'] = 1
for _, required_resource_tuple in ipairs(required_resources)
do
  local required_resource_key = required_resource_tuple[1]
  local required_resource_amount = required_resource_tuple[2]
  out[required_resource_key] = required_resource_amount
end
  