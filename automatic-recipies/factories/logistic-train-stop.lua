
local resource_key = 'logistic-train-stop'
local required_resources =
{
  {'train-stop', 1},  {'small-lamp', 1},  {'red-wire', 2},  {'green-wire', 2},  {'constant-combinator', 1},
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
  