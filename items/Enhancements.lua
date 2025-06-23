SMODS.Enhancement({
	key = "originium",

	atlas = "bark_enhan",

	pos = { x = 1, y = 1 },

	config = {
		Xmult = 1.5,
		extra = {},
	},

	loc_vars = function(_, _, card)
		return { vars = { card.ability.Xmult } }
	end,

	calculate = function(self, card, context)
		return {}
	end,
})
