return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	config = function()
		-- local highlight = {
		-- 	"RainbowRed",
		-- 	"RainbowYellow",
		-- 	"RainbowBlue",
		-- 	"RainbowOrange",
		-- 	"RainbowGreen",
		-- 	"RainbowViolet",
		-- 	"RainbowCyan",
		-- }
		-- local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		-- Tokyo night
		-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		-- 	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f7768e" })
		-- 	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#e0af68" })
		-- 	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7aa2f7" })
		-- 	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#ff9e64" })
		-- 	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#9ece6a" })
		-- 	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#9d7cd8" })
		-- 	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#7dcfff" })
		-- end)

		-- Everforest
		-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		-- 	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#e67e80" })
		-- 	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#dbbc7f" })
		-- 	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7fbbb3" })
		-- 	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e69875" })
		-- 	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a7c080" })
		-- 	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#d699b6" })
		-- 	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#83c092" })
		-- end)
		-- vim.g.rainbow_delimiters = { highlight = highlight }
		-- require("ibl").setup({ scope = { highlight = highlight } })
		require("ibl").setup()

		-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
