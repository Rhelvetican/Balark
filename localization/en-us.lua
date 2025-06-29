return {
	descriptions = {
		Joker = {
			j_bark_mudrock = {
				name = "Mudrock",
				text = {
					"This Joker gains {X:mult,C:white,E:2}X#1#{}",
					"for every {C:attention}Stone{} card scored.",
					"At the end of round,",
					"increase gain amount by {X:mult,C:white,E:2,s:2.0}X0.25{}.",
					"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
				},
			},

			j_bark_chen2 = {
				name = "Ch'en the Holungday",
				text = {
					{
						"For the next {C:attention}#1#{} hands",
						"each cards scored gives {X:mult,C:white,E:2}X#1#{}.",
						"When the above effect is expired,",
						"after {C:attention}4{} rounds, {C:attention}refresh{} this Joker.",
					},
					"{C:inactive}({B:1,C:white} #3# {C:inactive}hands left.){}",
					"{C:inactive}(Refresh in{}{B:1,C:white} #2# {C:inactive}rounds.){}",
				},
			},
		},

		Spectral = {
			c_bark_hyperion = {
				name = "Hyperion",
				text = {
					"Creates a {B:1,E:2,s:1.5}Mythic{} Joker.",
				},
			},
		},
	},

	misc = {
		dictionary = {
			k_bark_mythic = "Mythic",
		},

		label = {},
	},
}
