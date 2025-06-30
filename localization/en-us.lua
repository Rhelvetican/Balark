return {
	descriptions = {
		Joker = {
			j_arkl_mudrock = {
				name = "Mudrock",
				text = {
					"This Joker gains {X:mult,C:white,E:2}X#1#{}",
					"for every {C:attention}Stone{} card scored.",
					"At the end of round,",
					"increase gain amount by {X:mult,C:white,E:2,s:2.0}X0.25{}.",
					"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
				},
			},

			j_arkl_chen2 = {
				name = "Ch'en the Holungday",
				text = {
					"For the next {C:attention}#3#{} scoring cards,",
					"each gives {X:mult,C:white,E:2}X#1#{}.",
					"When the above effect is expired,",
					"after {C:attention}2{} rounds, {C:attention}refresh{} this Joker.",

					"{C:inactive}(Refresh in {}{B:1,C:white}#2#{C:inactive} rounds.){}",
				},
			},

			j_arkl_wisadel = {
				name = "Wis'adel",
				text = {
					"Convert all scored playing cards into",
					"{X:edition,C:attention,E:1}Polychrome{} {X:edition,C:attention,E:1}Polychrome}Red{} {X:edition,C:attention,E:1}Polychrome}Seal{} {X:edition,C:attention,E:1}Polychrome}Steel{} {X:edition,C:attention,E:1}Polychrome}Kings{}",
					"Also gives {X:mult,V:1,E:2,s:3.0}X#1#{} Mults.",
					"At the end of turn, increase {C:attention}hand size{} by {X:dark_edition,E:2,C:white}2{}.",
				},
			},
		},

		Spectral = {
			c_arkl_hyperion = {
				name = "Hyperion",
				text = {
					"Creates a {B:1,E:2,s:1.5}Mythic{} Joker.",
				},
			},
		},
	},

	misc = {
		dictionary = {
			k_arkl_mythic = "Mythic",
			k_arkl_transcendental = "Transcendental",
			k_refreshed = "Refreshed!",
		},

		label = {},
	},
}
