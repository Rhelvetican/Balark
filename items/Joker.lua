SMODS.Consumable({
	key = "hyperion",
	set = "Spectral",

	cost = 4,
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

	config = {},

	can_use = function(self, _)
		return #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers
	end,

	use = function(_, _)
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

SMODS.Joker({
	key = "mudrock",
	rarity = "bark_mythic",
	cost = 20,

	config = {
		extra = {
			x_mult_gain = 0.5,
			x_mult = 1.0,
			flag = true,
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
