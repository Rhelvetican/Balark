SMODS.Consumable({
	key = "hyperion",
	set = "Spectral",

	cost = 4,
	atlas = "bark_spectral",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },

	unlocked = true,
	discovered = true,

	---@diagnostic disable-next-line: assign-type-mismatch
	hidden = {
		soul_rate = 0.000015,
		can_repeat_soul = true,
	},

	config = {},

	loc_vars = function(_, _, _)
		return {
			vars = {
				colours = {
					Balark.gradient,
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
				SMODS.add_card({ set = "Joker", rarity = "bark_mythic" })
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))

		delay(0.6)
	end,
})

SMODS.Joker({
	key = "mudrock",
	rarity = "bark_mythic",
	cost = 30,

	config = {
		extra = {
			x_mult_gain = 0.5,
			x_mult = 1.0,
		},
	},

	pos = {
		x = 0,
		y = 0,
	},

	soul_pos = {
		x = 1,
		y = 0,
	},

	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	pools = {},

	atlas = "joker",

	loc_vars = function(_, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone

		return {
			vars = {
				center.ability.extra.x_mult_gain,
				center.ability.extra.x_mult,
			},
		}
	end,

	calculate = function(_, card, context)
		if
			context.individual
			and context.cardarea == G.play
			and SMODS.has_enhancement(context.other_card, "m_stone")
		then
			card.ability.extra.x_mult = card.ability.extra.x_mult_gain + card.ability.extra.x_mult
		end

		if context.end_of_round and context.main_eval then
			card.ability.extra.x_mult_gain = card.ability.extra.x_mult_gain + 0.25
		end

		if context.joker_main then
			return { xmult = card.ability.extra.x_mult }
		end
	end,
})

SMODS.Joker({
	key = "chen2",
	rarity = "bark_mythic",
	cost = 30,

	config = {
		extra = {
			x_mult = 1.25,
			round = 4,
			hands = 32,
		},
	},

	pos = {
		x = 2,
		y = 0,
	},

	soul_pos = {
		x = 3,
		y = 0,
	},

	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	pools = {},

	atlas = "joker",

	loc_vars = function(_, _, center)
		return {
			vars = {
				center.ability.extra.x_mult,
				center.ability.extra.round,
				center.ability.extra.hands,

				colours = {
					HEX("#111111"),
				},
			},
		}
	end,

	calculate = function(_, card, context)
		if card.ability.extra.hands > 0 and context.individual and context.cardarea == G.play then
			return { xmult = card.ability.extra.x_mult }
		end

		if context.after and not context.blueprint and card.ability.extra.hands > 0 then
			card.ability.extra.hands = card.ability.extra.hands - 1
		end

		if context.end_of_round and card.ability.extra.hands == 0 and context.main_eval then
			if card.ability.extra.round == 0 then
				card.ability.extra.hands = 32
				card.ability.extra.round = 4
			elseif card.ability.extra.round > 0 then
				card.ability.extra.round = card.ability.extra.round - 1
			end
		end
	end,
})
