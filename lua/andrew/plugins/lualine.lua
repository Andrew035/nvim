return {
	enabled = true,
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			options = {
				theme = "auto",
				component_separators = "",
				-- section_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "NvimTree", "help" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						-- separator = { left = "", right = "" },
						separator = { left = "", right = "" },
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
						-- separator = { left = "", right = "" },
						separator = { left = "", right = "" },
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
