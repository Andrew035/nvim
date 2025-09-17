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
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				term_colors = true,
				styles = {
					functions = { "bold", "italic" },
					booleans = { "bold" },
				},
				color_overrides = {},
				custom_highlights = {},
				highlight_overrides = {
					-- mocha = function(colors)
					-- 	return {
					-- 		LineNr = { fg = colors.overlay0 },
					-- 	}
					-- end,
				},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = false,
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
			require("tokyonight").setup({
				style = "night",
				light_style = "day",
				day_brightness = 0.3,
				transparent = false,
				dim_inactive = false,
				terminal_colors = true,
				styles = {
					-- sidebars = "transparent",
					-- floats = "transparent",
					comments = {},
					keywords = {},
					functions = {},
					variables = {},
				},
				plugins = {},
				lualine_bold = false,
				cache = true,
				on_highlights = function(hl, c) end,
				on_colors = function(colors)
					colors.bg_statusline = colors.none
				end,
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
				variant = "moon",
				dark_variant = "moon",
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
				transparent_background = false,
			})
			vim.cmd.colorscheme("tokyodark")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Default options
			require("nightfox").setup({
				options = {
					-- Compiled file's destination location
					compile_path = vim.fn.stdpath("cache") .. "/nightfox",
					compile_file_suffix = "_compiled", -- Compiled file suffix
					transparent = false, -- Disable setting background
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
					dim_inactive = false, -- Non focused panes set to alternative background
					module_default = true, -- Default enable value for modules
					colorblind = {
						enable = false, -- Enable colorblind support
						simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
						severity = {
							protan = 0, -- Severity [0,1] for protan (red)
							deutan = 0, -- Severity [0,1] for deutan (green)
							tritan = 1, -- Severity [0,1] for tritan (blue)
						},
					},
					styles = { -- Style to be applied to different syntax groups
						comments = "italic", -- Value is any valid attr-list value `:help attr-list`
						conditionals = "bold",
						constants = "bold",
						functions = "italic",
						keywords = "NONE",
						numbers = "bold",
						operators = "NONE",
						strings = "NONE",
						types = "italic,bold",
						variables = "NONE",
					},
					inverse = { -- Inverse highlight for different types
						match_paren = false,
						visual = false,
						search = false,
					},
					modules = { -- List of various plugins and additional options
						-- ...
					},
				},
				palettes = {},
				specs = {},
				groups = {},
			})
			vim.cmd.colorscheme("nightfox")
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
					transparency = false,
					lualine_transparency = true,
				},
			})
			vim.cmd.colorscheme("onedark")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({
				transparent = true,
			})
			vim.cmd.colorscheme("nord")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
			vim.cmd.colorscheme("gruvbox")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = false,
				theme = "wave",
				background = {
					dark = "wave",
					light = "lotus",
				},
				colors = {
					theme = {
						all = {
							ui = { bg_gutter = "none" },
						},
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
					}
				end,
			})
			vim.cmd.colorscheme("kanagawa")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("lackluster").setup({
				tweak_background = {
					normal = "none",
					telescope = "none",
					menu = "none",
					popup = "none",
				},
				disable_plugin = {},
			})
			vim.cmd.colorscheme("lackluster")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				disable_background = true,
				disable_float_background = true,
			})
			vim.cmd.colorscheme("poimandres")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vscode").setup({
				transparent = true,
				disable_nvimtree_bg = true,
			})
			vim.cmd.colorscheme("vscode")
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"shrikecode/kyotonight.vim",
		lazy = false,
		priority = 1000,
		config = function()
			local g = vim.g

			g.kyotonight_bold = 1
			g.kyotonight_underline = 1
			g.kyotonight_italic = 1
			g.kyotonight_italic_comments = 1
			g.kyotonight_uniform_status_lines = 0
			g.kyotonight_bold_vertical_split_line = 1
			g.kyotonight_cursor_line_number_background = 0
			g.kyotonight_uniform_diff_background = 0
			g.kyotonight_lualine_bold = 1

			vim.cmd([[colorscheme kyotonight]])
			vim.opt.fillchars = { eob = " " }
		end,
	},
	{
		enabled = false,
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = "medium" -- hard, medium, soft
			vim.g.everforest_better_performance = 1
			vim.g.everforest_cursor = "green"
			vim.g.everforest_float_style = "none" -- bright, dim, none
			vim.cmd.colorscheme("everforest")
			vim.opt.fillchars = { eob = " " }
		end,
	},
}
