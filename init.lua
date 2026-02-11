-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
