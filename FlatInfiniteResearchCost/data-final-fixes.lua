-- should the previous levels leading to infinite research also be changed?
local changesAllLevels = settings.startup["flatcost-affect-all"].value

if changesAllLevels then
	-- also include previous levels
	for i, tech in pairs(data.raw["technology"]) do
		if (tech.unit.count_formula ~= nil) then
			tech.unit.count_formula = settings.startup["flatcost-price"].value			
			tech.unit.time = settings.startup["flatcost-time"].value
		end
	end
else 
	-- for all technologies...
	for techname, tech in pairs(data.raw["technology"]) do
		-- ... check if they are infinite researches...
		if tech.max_level == "infinite" then
			-- ... and adapt the price of the researche if they are infinite
			tech.unit.count_formula = settings.startup["flatcost-price"].value
			tech.unit.time = settings.startup["flatcost-time"].value
		end
	end
end
