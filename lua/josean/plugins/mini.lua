return {
	{
		enabled = false,
		"echasnovski/mini.starter",
		version = "*",
		config = function()
			require("mini.starter").setup()
		end,
	},
	{
		"echasnovski/mini.files",
		version = "*",
		config = function()
			require("mini.files").setup({
				mappings = {
					go_in = "",
					go_in_plus = "l",
					synchronize = "<CR>",
				},
			})

			local minifiles_toggle = function(...)
				if not MiniFiles.close() then
					MiniFiles.open(nil, false)
				end
			end
			vim.keymap.set("n", "<leader>e", minifiles_toggle)

			vim.api.nvim_create_autocmd("User", {
				pattern = "TelescopeFindPre",
				callback = function()
					local ok, mini_files = pcall(require, "mini.files")
					if ok then
						mini_files.close()
					end
				end,
			})
		end,
	},
}
