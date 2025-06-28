SMODS.Consumable({
	key = "Hyperion",
	set = "Spectral",

	atlas = "bark_spectral",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },

	unlocked = true,
	discovered = true,
	no_collection = true,

	hidden = {
		soul_rate = 0.000015,
		can_repeat_soul = true,
	},

	can_use = function(self, _)
		return #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers
	end,

	use = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				local jonkler = SMODS.create_card({
					area = G.jokers,
					rarity = "bark_mythic",
					set = "Joker",
				})

				jonkler:add_to_deck()
				G.jokers:emplace(jonkler)
			end,
		}))
	end,
})
