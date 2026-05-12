return {
	{
		enabled = true,
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		enabled = false,
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = false,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		enabled = false,
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_better_performance = 1
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		enabled = false,
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				bold = false,
			})
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		enabled = false,
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "auto",
				dark_variant = "moon",
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		enabled = false,
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({})
			vim.cmd.colorscheme("everforest")
		end,
	},
	{
		enabled = false,
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedarkpro").setup({})
			vim.cmd.colorscheme("vaporwave")
		end,
	},
	{
		enabled = false,
		"Aejkatappaja/sora",
		lazy = false,
		priority = 1000,
		config = function()
			require("sora").setup({
				transparent = true,
			})
			vim.cmd.colorscheme("sora")
		end,
	},
}
