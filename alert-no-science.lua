-- TODO: make this generic using an array instead of copy paste

local minutes_without_science_to_alert = 5

delay, irq, out.lab = 60, 'se-rocket-science-pack', out.lab + 1
delay, irq, out.lab = 60, 'logistic-science-pack', out.lab + 1
delay, irq, out.lab = 60, 'chemical-science-pack', out.lab + 1
delay, irq, out.lab = 60, 'military-science-pack', out.lab + 1
delay, irq, out.lab = 60, 'automation-science-pack', out.lab + 1

if green['se-rocket-science-pack'] >= 1 then
  out.lab = 0
end

if green['logistic-science-pack'] >= 1 then
  out.lab = 0
end

if green['chemical-science-pack'] >= 1 then
  out.lab = 0
end

if green['military-science-pack'] >= 1 then
  out.lab = 0
end

if green['automation-science-pack'] >= 1 then
  out.lab = 0
end

-- the counter goes up by 5 every second
if out.lab >= (minutes_without_science_to_alert * 60) * 5 then
  out['signal-info'] = 2
else
  out['signal-info'] = 0
end
