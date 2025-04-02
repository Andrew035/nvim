return {
	{
		"echasnovski/mini.files",
		version = "*",
		config = function()
			require("mini.files").setup({
				mappings = {
					synchronize = "<CR>",
				},
			})

			vim.keymap.set("n", "<leader>e", function()
				if not MiniFiles.close() then
					MiniFiles.open(MiniFiles.get_latest_path(), true)
				end
			end)

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
	{
		"echasnovski/mini.starter",
		version = "*",
		config = function()
			local starter = require("mini.starter")
			starter.setup({})
		end,
	},
}
