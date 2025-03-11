return {
	enabled = true,
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- local colors = require("solarized-osaka.colors").setup({ transform = true })
		-- local config = require("solarized-osaka.config").options
		-- local inactive_bg = nil
		--
		-- local solarized_osaka = {}
		--
		-- solarized_osaka.normal = {
		-- 	a = { bg = colors.blue, fg = colors.black },
		-- 	b = { bg = colors.base0, fg = colors.base04 },
		-- 	c = { bg = inactive_bg, fg = colors.fg },
		-- }
		--
		-- solarized_osaka.insert = {
		-- 	a = { bg = colors.green, fg = colors.black },
		-- }
		--
		-- solarized_osaka.command = {
		-- 	a = { bg = colors.yellow, fg = colors.black },
		-- }
		--
		-- solarized_osaka.visual = {
		-- 	a = { bg = colors.magenta, fg = colors.black },
		-- }
		--
		-- solarized_osaka.replace = {
		-- 	a = { bg = colors.red, fg = colors.black },
		-- }
		--
		-- solarized_osaka.terminal = {
		-- 	a = { bg = colors.green, fg = colors.black },
		-- }
		--
		-- solarized_osaka.inactive = {
		-- 	a = {
		-- 		bg = inactive_bg and colors.none or colors.bg_statusline,
		-- 		fg = config.hide_inactive_statusline and colors.bg or colors.blue,
		-- 		sp = config.hide_inactive_statusline and colors.border or colors.none,
		-- 		underline = config.hide_inactive_statusline,
		-- 	},
		-- 	b = {
		-- 		bg = inactive_bg and colors.none or colors.bg_statusline,
		-- 		fg = config.hide_inactive_statusline and colors.bg or colors.fg,
		-- 		sp = config.hide_inactive_statusline and colors.border or colors.none,
		-- 		underline = config.hide_inactive_statusline,
		-- 		gui = "bold",
		-- 	},
		-- 	c = {
		-- 		bg = inactive_bg and colors.none or colors.bg_statusline,
		-- 		fg = config.hide_inactive_statusline and colors.bg or colors.fg,
		-- 		sp = config.hide_inactive_statusline and colors.border or colors.none,
		-- 		underline = config.hide_inactive_statusline,
		-- 	},
		-- }

		-- local colors = {
		-- 	-- tokyonight
		-- 	blue = "#7aa2f7",
		-- 	green = "#73daca",
		-- 	violet = "#bb9af7",
		-- 	yellow = "#e0af68",
		-- 	red = "#f7768e",
		-- 	fg = "#a9b1d6",
		-- 	bg = "#1A1B26",
		-- 	inactive_bg = nil,
		-- }

		-- local my_lualine_theme = {
		-- 	normal = {
		-- 		a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.inactive_bg, fg = colors.fg },
		-- 	},
		-- 	insert = {
		-- 		a = { bg = colors.green, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.inactive_bg, fg = colors.fg },
		-- 	},
		-- 	visual = {
		-- 		a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.inactive_bg, fg = colors.fg },
		-- 	},
		-- 	command = {
		-- 		a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.inactive_bg, fg = colors.fg },
		-- 	},
		-- 	replace = {
		-- 		a = { bg = colors.red, fg = colors.bg, gui = "bold" },
		-- 		b = { bg = colors.bg, fg = colors.fg },
		-- 		c = { bg = colors.inactive_bg, fg = colors.fg },
		-- 	},
		-- 	inactive = {
		-- 		a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
		-- 		b = { bg = colors.inactive_bg, fg = colors.semilightgray },
		-- 		c = { bg = colors.inactive_bg, fg = colors.semilightgray },
		-- 	},
		-- }

		lualine.setup({
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						-- separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_b = {
					{
						"filename",
					},
					"branch",
				},
				lualine_c = {
					{
						"searchcount",
						maxcount = 999,
						timeout = 500,
					},
				},
				lualine_x = {
					{
						"filetype",
						colored = true,
					},
				},
				lualine_y = {
					{
						"datetime",
						style = "%H:%M:%S",
					},
				},
				lualine_z = {
					{
						"location",
						separator = { left = "", right = "" },
						-- separator = { left = "", right = "" },
						left_padding = 2,
					},
				},
			},
			inactive_sections = {
				lualine_a = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
					"diagnostics",
					"diff",
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
