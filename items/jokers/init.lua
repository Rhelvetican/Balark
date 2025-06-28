local thunk = { "Common.lua", "Legendary.lua", "Rare.lua", "Uncommon.lua" }

for _, item in pairs(thunk) do
	Balark.utils.loadFile("items/jokers/" + item)
end

return thunk
