if not SMODS then
	return
end

local function SmodsLoads(path)
	assert(SMODS.load_file(path))
end

SmodsLoads("./items/Atlas.lua")
SmodsLoads("./items/OriginiumCard.lua")
