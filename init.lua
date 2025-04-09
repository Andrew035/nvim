require("andrew.core")
require("andrew.lazy")
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/neovim-py/bin/python3")
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "css" },
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
