return {
	{
		-- catppuccin
		enabled = true, -- dims the background color of inactive window
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background light = "latte",
					dark = "mocha",
				},
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				no_italic = true, -- Force no italic
				no_bold = true, -- Force no bold
				no_underline = false, -- Force no underline
				term_colors = true,
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic", "bold" },
					loops = {},
					functions = { "bold" },
					keywords = { "italic" },
					strings = {},
					variables = {},
					numbers = { "bold" },
					booleans = { "bold" },
					properties = {},
					types = { "italic" },
					operators = { "italic" },
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {},
				custom_highlights = {},
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
		enabled = false,
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			local transparent = false -- set to true if you would like to enable transparency
			require("tokyonight").setup({
				style = "night",
				transparent = transparent,
				styles = {
					sidebars = transparent and "transparent" or "dark",
					floats = transparent and "transparent" or "dark",
					comments = {},
					keywords = {},
					functions = {},
					variables = {},
				},
				on_highlights = function(hl, c) end,
				on_colors = function(colors) end,
			})

			vim.cmd("colorscheme tokyonight")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				transparent = {
					bg = false,
					float = false,
				},
				bold_keywords = true,
				italic_comments = true,
				reduced_blue = false,
				noice = {
					style = "classic",
				},
				telescope = {
					style = "classic",
				},
			})
			vim.cmd.colorscheme("nordic")
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
					comments = { italic = true },
					keywords = { italic = true, bold = true },
					functions = { italic = true, bold = true },
					variables = {},
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
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
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
				palette = {
					-- Increase saturation and contrast in key colors
					rose = "#eb6f92", -- More vibrant rose
					pine = "#31748f", -- More intense teal
					foam = "#78dce8", -- Brighter cyan
					gold = "#f9c859", -- More striking gold
					iris = "#c4a7e7", -- Vibrant purple
					love = "#ff6b8a", -- More saturated red
					sapphire = "#62b3d4", -- Enhanced blue
					text = "#e0def4", -- Brighten text
					subtle = "#908caa", -- Adjust subtle contrast
					overlay = "#3e445e", -- Make overlays stand out
				},
				highlight_groups = {
					Normal = { fg = "text", bg = "none" }, -- Ensure no dull background
					Comment = { fg = "subtle", italic = true }, -- Make comments stand out
					Keyword = { fg = "love", bold = true }, -- Make keywords pop
					Function = { fg = "iris", bold = true }, -- Enhance function visibility
					Variable = { fg = "foam" }, -- Make variables distinct
					Constant = { fg = "gold", bold = true }, -- Highlight constants
					String = { fg = "pine" }, -- Improve string readability
					Type = { fg = "sapphire", bold = true }, -- Distinguish types
					Statement = { fg = "love", bold = true }, -- Make statements striking
				},
				before_highlight = function(group, highlight, palette) end,
			})
			vim.cmd.colorscheme("rose-pine-moon")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_transparent_background = 2
			vim.g.gruvbox_material_background = "soft"
			vim.cmd.colorscheme("gruvbox-material")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = true
			vim.g.nord_italic = true
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = true
			vim.g.nord_cursorline_transparent = false
			vim.opt.fillchars = { eob = " " }

			require("nord").set()
		end,
	},
	{
		enabled = false,
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_background = "hard"
			vim.g.everforest_better_performance = 1
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_disable_italic_comment = 0
			vim.g.everforest_transparent_background = 2
			vim.cmd.colorscheme("everforest")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("lackluster").setup({})
			vim.cmd.colorscheme("lackluster")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.sonokai_enable_italic = true
			vim.g.sonokai_transparent_background = 2
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_style = "andromeda"
			vim.cmd.colorscheme("sonokai")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"sainnhe/edge",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.edge_enable_italic = true
			vim.g.edge_transparent_background = 2
			vim.g.edge_better_performance = 1
			vim.g.edge_float_style = "dim"
			vim.g.edge_style = "neon"
			vim.cmd.colorscheme("edge")
			vim.opt.fillchars = { eob = " " }
		end,
	},
}
