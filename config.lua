local _, ns = ...;

local config = {
	{
		["class"] = "WARRIOR",
		["spec"] = 2, -- fury
		["triggers"] = {
			{
				["type"] = "POWER",
				["target"] = "player",
				["powerType"] = SPELL_POWER_RAGE,
				["powerPercent"] = 85,
			},
			{
				["type"] = "POWER",
				["target"] = "player",
				["powerType"] = SPELL_POWER_RAGE,
				["powerValue"] = 85,
			},
		},
		["actions"] = {
			{
				["type"] = "GLOW",
				["spellId"] = 184367,
			},
		},
	},
	{
		["class"] = "WARRIOR",
		["spec"] = 2, -- fury
		["triggers"] = {
			{
				["type"] = "AURA",
				["filter"] = "PLAYER HELPFUL",
				["target"] = "player",
				["spellId"] = 184364
			},
		},
		["actions"] = {
			{
				["type"] = "GLOW",
				["spellId"] = 23881,
			},
		},
	},
	-- Deathknight
	{
		["class"] = "DEATHKNIGHT",
		["spec"] = 3, -- unholy
		["triggers"] = {
			{
				["type"] = "AURA",
				["filter"] = "PLAYER HARMFUL",
				["target"] = "target",
				["spellId"] = 194310,
				["active"] = true,
				["minCount"] = 7,
			},
		},
		["actions"] = {
			{
				["type"] = "GLOW",
				["spellId"] = 55090,
			},
		},
	},
	{
		["class"] = "DEATHKNIGHT",
		["spec"] = 3, -- unholy
		["triggers"] = {
			{
				["type"] = "AURA",
				["filter"] = "PLAYER HARMFUL",
				["target"] = "target",
				["spellId"] = 194310,
				["active"] = false
			},
			{
				["type"] = "AURA",
				["filter"] = "PLAYER HARMFUL",
				["target"] = "target",
				["spellId"] = 194310,
				["active"] = true,
				["maxCount"] = 3,
			},
		},
		["actions"] = {
			{
				["type"] = "GLOW",
				["spellId"] = 85948,
			},
		},
	},
	{
		["class"] = "DEATHKNIGHT",
		["spec"] = 3, -- unholy
		["triggers"] = {
			{
				["type"] = "AURA",
				["filter"] = "PLAYER HARMFUL",
				["target"] = "target",
				["spellId"] = 191587,
				["active"] = false
			},
			{
				["type"] = "AURA",
				["filter"] = "PLAYER HARMFUL",
				["target"] = "target",
				["spellId"] = 191587,
				["active"] = true,
				["expiration"] = 3,
			},
		}, 
		["actions"] = {
			{
				["type"] = "GLOW",
				["spellId"] = 77575,
			},
		},
	},
};


ns.config = config;