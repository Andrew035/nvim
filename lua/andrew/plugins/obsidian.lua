return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	ft = "markdown",
	dependendcies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
			{
				name = "CMSC 421",
				path = "~/vaults/cmsc421",
			},
			{
				name = "CMSC 411",
				path = "~/vaults/cmsc411",
			},
			{
				name = "CMSC 426",
				path = "~/vaults/cmsc426",
			},
			{
				name = "Projects",
				path = "~/vaults/projects",
			},
		},
		ui = {
			enable = true,
		},
	},
}
