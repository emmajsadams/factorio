local resources_to_stockpile = {
  'uranium-ore',
  'crude-oil-barrel',
  'se-core-fragment-omni',
  'used-up-uranium-fuel-cell'
}

out['ltn-network-id'] = 1 -- by default we are all on network one
out['ltn-disable-warnings'] = 1 -- no need for warnings this is a stockpile
out['ltn-requester-priority'] = 9999 -- we override all requests because everything should come back here

for _, resource_to_stockpile in ipairs(resources_to_stockpile)
do
  out[resource_to_stockpile] = -99999
end


-- useful for testing a new stop is working! overrides any settings above
local temp_blacklist = {}
for _, temp_blacklist_resource in ipairs(temp_blacklist)
do
  out[temp_blacklist_resource] = nil
end
