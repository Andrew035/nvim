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
}
