return {
  "folke/snacks.nvim",
  opts = {
    explorer = { enabled = false },
    picker = {
      win = {
        input = {
          keys = {
            ["<C-n>"] = { "list_down", mode = { "i", "n" } },
            ["<C-p>"] = { "list_up", mode = { "i", "n" } },
          },
        },
      },
      sources = {
        explorer = {
          auto_close = true,
          jump = { close = true },
        },
      },
    },
  },
}
