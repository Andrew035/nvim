return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		-- 1. Define the Tokyo Night palette to match your tmux config
		local colors = {
			bg = nil, -- Keeps it transparent like tmux "bg=default"
			fg = "#c0caf5", -- Standard text
			green = "#9ece6a", -- Tmux session color
			blue = "#7aa2f7", -- Tmux active window color
			inactive = "#545c7e", -- Tmux inactive window / git branch color
			purple = "#bb9af7", -- Visual mode color
			red = "#f7768e", -- Replace mode color
		}

		-- 2. Create the custom theme mapped to those colors
		local tokyo_tmux_theme = {
			normal = {
				a = { bg = colors.bg, fg = colors.green, gui = "bold" },
				b = { bg = colors.bg, fg = colors.blue, gui = "bold" },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.bg, fg = colors.blue, gui = "bold" },
				b = { bg = colors.bg, fg = colors.blue, gui = "bold" },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.bg, fg = colors.purple, gui = "bold" },
				b = { bg = colors.bg, fg = colors.blue, gui = "bold" },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.bg, fg = colors.red, gui = "bold" },
				b = { bg = colors.bg, fg = colors.blue, gui = "bold" },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.bg, fg = colors.inactive },
				b = { bg = colors.bg, fg = colors.inactive },
				c = { bg = colors.bg, fg = colors.inactive },
			},
		}

		-- 3. Apply the theme and structure the sections
		require("lualine").setup({
			options = {
				theme = tokyo_tmux_theme,
				component_separators = "",
				section_separators = "",
				globalstatus = true, -- Highly recommended to maintain the single-bar tmux aesthetic
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:lower() -- Lowercase matches the tmux session name vibe
						end,
					},
				},
				lualine_b = {
					{
						"filetype",
						icon_only = true,
						colored = true, -- Set to false if you want the icon to perfectly match the Tokyo Night blue text
						padding = { left = 1, right = 0 }, -- Removes space between the icon and filename
					},
					{
						"filename",
						file_status = true,
						path = 0,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
						},
						padding = { left = 0, right = 1 }, -- Removes space on the left to sit flush with the icon
					},
				},
				lualine_c = {},
				lualine_x = {
					{
						"diff",
						symbols = { added = "✚ ", modified = "● ", removed = "✖ " },
						diff_color = {
							added = { fg = colors.green }, -- Tokyo Night Green
							modified = { fg = colors.blue }, -- Tokyo Night Blue
							removed = { fg = colors.red }, -- Tokyo Night Red
						},
						color = { bg = nil }, -- Keeps the background transparent
					},
				},
				lualine_y = {
					{
						"branch",
						color = { fg = colors.purple, bg = "NONE" },
						icon = "", -- Leave empty to mirror the bare 'git rev-parse' in your tmux config
					},
				},
				lualine_z = {
					{
						"location",
						color = { fg = colors.inactive, bg = "NONE" },
						icon = "",
					},
				},
			},
		})
	end,
}
