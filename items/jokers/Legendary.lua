SMODS.Joker({
	key = "mudrock",
	rarity = 4,
	cost = 20,

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

	-- For future pack lol
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

		if context.end_of_round then
			print("GAINS")
			card.ability.extra.x_mult_gain = card.ability.extra.x_mult_gain + 0.25
		end

		if context.joker_main then
			return { xmult = card.ability.extra.x_mult }
		end
	end,
})

-- dummy
-- SMODS.Joker({
-- 	key = "???",
-- 	rarity = 4,
-- 	cost = 20,
--
-- 	config = {},
--
-- 	pos = {
-- 		x = 2,
-- 		y = 0,
-- 	},
--
-- 	soul_pos = {
-- 		x = 3,
-- 		y = 0,
-- 	},
--
-- 	blueprint_compat = true,
-- 	eternal_compat = true,
-- 	perishable_compat = true,
--
-- 	-- For future pack lol
-- 	pools = {},
--
-- 	atlas = "joker",
--
-- 	loc_vars = function(_, _, _)
-- 		return {}
-- 	end,
--
-- 	calculate = function(_, _, _)
-- 		return { xmult = 9999999 }
-- 	end,
-- })
