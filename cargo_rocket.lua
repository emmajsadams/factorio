-- cargo rocket has 500 slots
-- rough estimates to get the ball rolling
-- steel: 5000
-- TODO: automate this script
-- TODO: set requesters back to zero and move ingridents to providers when done

if red['steel-plate'] <= 5000 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end


if red['low-density-structure'] <= 1000 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end

if red['se-delivery-cannon-capsule'] <= 300 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end

if red['se-delivery-cannon-capsule'] <= 300 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end

if red['electric-motor'] <= 500 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end

if red['water-barrel'] <= 500 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end

if red['lubricant-barrel'] <= 500 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end

if red['processing-unit'] <= 500 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end

if red['rocket-fuel'] <= 1000 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end


if red['rocket-fuel'] <= 2000 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end


if red['stone'] <= 5000 then
  out['signal-info'] = 1
else
  out['signal-info'] = 2
end
