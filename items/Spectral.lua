SMODS.Consumable({
	key = "hyperion",
	set = "Spectral",

	cost = 4,
	atlas = "arkl_spectral",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },

	unlocked = true,
	discovered = true,

	---@diagnostic disable-next-line: assign-type-mismatch
	hidden = {
		soul_rate = 0.000015,
		can_repeat_soul = true,
	},

	loc_vars = function(_, _, _)
		return {
			vars = {
				colours = {
					Arklatro.gradient.mythic,
				},
			},
		}
	end,

	can_use = function(self, _)
		return #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers
	end,

	use = function(_, card, _, _)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				SMODS.add_card({ set = "Joker", rarity = "arkl_mythic" })
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))

		delay(0.6)
	end,
})
