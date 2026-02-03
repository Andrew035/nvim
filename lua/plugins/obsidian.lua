return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    -- If you want to use the plugin on your vault,
    -- replace '~/MyVault' with your actual vault path
    "BufReadPre "
      .. vim.fn.expand("~")
      .. "/MyVault/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "Obsidian Vault/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian Vault/",
      },
    },
    -- Other configurations...
  },
}
