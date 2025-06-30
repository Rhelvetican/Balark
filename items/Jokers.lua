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

SMODS.Joker({
	key = "mudrock",
	rarity = "arkl_mythic",
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

			return {
				message = localize("k_upgrade_ex"),
				colours = G.C.MULT,
			}
		end

		if context.joker_main then
			return { xmult = card.ability.extra.x_mult }
		end
	end,
})

SMODS.Joker({
	key = "chen2",
	rarity = "arkl_mythic",
	cost = 30,

	config = {
		extra = {
			x_mult = 2.5,
			rounds = 2,
			cards = 32,
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
				center.ability.extra.rounds,
				center.ability.extra.cards,

				colours = {
					HEX("1C1C1C"),
				},
			},
		}
	end,

	calculate = function(_, card, context)
		if card.ability.extra.cards > 0 and context.individual and context.cardarea == G.play then
			card.ability.extra.cards = card.ability.extra.cards - 1
			return { xmult = card.ability.extra.x_mult }
		end

		if context.end_of_round and card.ability.extra.cards == 0 and context.main_eval then
			if card.ability.extra.rounds == 0 then
				card.ability.extra.cards = 32
				card.ability.extra.rounds = 2

				return {
					message = localize("k_refreshed"),
					colour = G.C.FILTER,
				}
			elseif card.ability.extra.rounds > 0 then
				card.ability.extra.rounds = card.ability.extra.rounds - 1

				return {
					message = card.ability.extra.rounds .. "rounds left!",
					colour = G.C.FILTER,
				}
			end
		end
	end,
})

SMODS.Joker({
	key = "wisadel",
	rarity = "arkl_transcendental",
	cost = 9999,

	config = {
		extra = {
			x_mult = 9.99e256,
			hand_size_increase = 2,
		},
	},

	pos = {
		x = 4,
		y = 0,
	},

	soul_pos = {
		x = 5,
		y = 0,

		extra = {
			x = 6,
			y = 0,
		},
	},

	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	pools = {},

	atlas = "joker",

	loc_vars = function(_, _, card)
		return {
			vars = {
				card.ability.extra.x_mult,
				card.ability.extra.hand_size_increase,
				colours = {
					Arklatro.gradient.transcendental,
				},
			},
		}
	end,

	calculate = function(_, card, context)
		if
			context.cardarea == G.jokers
			and context.before
			and not context.blueprint_card
			and not context.retrigger_joker
		then
			for i = 1, #context.scoring_hand do
				local other_card = context.scoring_hand[i]

				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.4,
					func = function()
						play_sound("tarot1")
						other_card:juice_up(0.3, 0.5)
						return true
					end,
				}))
				delay(0.15)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.1,
					func = function()
						other_card:flip()
						return true
					end,
				}))
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						other_card = assert(SMODS.change_base(other_card, "Hearts", "King"))
						other_card:set_seal("Red", nil, true)
						other_card:set_edition("e_polychrome")
						other_card:set_ability("m_steel")
						other_card:juice_up()
						return true
					end,
				}))
				delay(0.2)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.1,
					func = function()
						other_card:flip()
						return true
					end,
				}))
			end

			return {
				message = "Ultimate!",
				colour = Arklatro.gradient.mythic,
			}
		end

		if context.joker_main then
			return { xmult = card.ability.extra.x_mult }
		end

		if context.end_of_round and context.main_eval then
			G.hand:change_size(card.ability.extra.hand_size_increase)
		end
	end,
})
