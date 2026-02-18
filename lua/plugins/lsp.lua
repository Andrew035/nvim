return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- Add a custom route to skip JDTLS progress spam
      table.insert(opts.routes, {
        filter = {
          event = "lsp",
          kind = "progress",
          find = "jdtls",
        },
        opts = { skip = true },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.pyright = {
        mason = false,
        autostart = false,
      }
      return opts
    end,
  },
}
