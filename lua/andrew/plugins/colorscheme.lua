return {
	{
		-- catppuccin
		enabled = false, -- dims the background color of inactive window
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				term_colors = true,
				styles = {},
				color_overrides = {},
				custom_highlights = {},
				highlight_overrides = {
					mocha = function(colors)
						return {
							LineNr = { fg = colors.overlay0 },
						}
					end,
				},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})
			vim.cmd.colorscheme("catppuccin")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = true,
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			local transparent = true -- set to true if you would like to enable transparency

			require("tokyonight").setup({
				style = "night",
				light_style = "day",
				day_brightness = 0.3,
				transparent = transparent,
				dim_inactive = false,
				terminal_colors = true,
				styles = {
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
					comments = {},
					keywords = {},
					functions = {},
					variables = {},
				},
				plugins = {},
				lualine_bold = false,
				cache = true,
				on_highlights = function(hl, c) end,
				on_colors = function(colors) end,
			})
			vim.cmd("colorscheme tokyonight")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
				dim_inactive_windows = false,
				extend_background_behind_borders = false,
				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},
				enable = {
					terminal = true,
					migrations = true,
				},
				groups = {},
				palette = {},
				highlight_groups = {
					StatusLineNC = { link = "StatusLine" },
				},
				before_highlight = function(group, highlight, palette) end,
			})
			vim.cmd.colorscheme("rose-pine")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"tiagovla/tokyodark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyodark").setup({
				transparent_background = true,
			})
			vim.cmd.colorscheme("tokyodark")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			vim.cmd.colorscheme("solarized-osaka")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedarkpro").setup({
				options = {
					transparency = true,
					lualine_transparency = true,
				},
			})
			vim.cmd.colorscheme("onedark_dark")
			vim.opt.fillchars = { eob = " " }
		end,
	},
}
