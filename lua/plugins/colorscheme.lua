return {
  {
    enabled = false,
    "catppuccin/nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        float = {
          transparent = true, -- enable transparent floating windows
          solid = false, -- use solid styling for floating windows, see |winborder|
        },
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        auto_integrations = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    enabled = false,
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = { ui = {
              bg_gutter = "none",
            } },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
        theme = "wave", -- Load "wave" theme
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })

      -- setup must be called before loading
      vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    enabled = false,
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("lackluster").setup({
        tweak_background = {
          normal = "default",
          telescope = "default",
          menu = "default",
          popup = "default",
        },
        disable_plugin = {},
      })
      vim.cmd.colorscheme("lackluster-dark")
    end,
  },
  {
    -- enabled = true,
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local transparent = false -- set to true if you would like to enable transparency

      -- local bg = "#011628"
      -- local bg_dark = "#011423"
      -- local bg_highlight = "#143651"
      -- local bg_search = "#0A64AC"
      -- local bg_visual = "#275378"
      -- local fg = "#CBE0F0"
      -- local fg_dark = "#B4D0E9"
      -- local fg_gutter = "#627E97"
      -- local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_highlights = function(h, c) end,
        on_colors = function(colors)
          -- colors.bg = bg
          -- colors.bg_dark = transparent and colors.none or bg_dark
          -- colors.bg_float = transparent and colors.none or bg_dark
          -- colors.bg_highlight = bg_highlight
          -- colors.bg_popup = bg_dark
          -- colors.bg_search = bg_search
          -- colors.bg_sidebar = transparent and colors.none or bg_dark
          -- colors.bg_statusline = transparent and colors.none or bg_dark
          -- colors.bg_visual = bg_visual
          -- colors.border = border
          -- colors.fg = fg
          -- colors.fg_dark = fg_dark
          -- colors.fg_float = fg
          -- colors.fg_gutter = fg_gutter
          -- colors.fg_sidebar = fg_dark
        end,
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    enabled = false,
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = false,
        on_colors = function(colors) end,
        on_highlights = function(highlights, colors) end,
      })
      require("solarized-osaka").setup()
      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
  {
    enabled = false,
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- auto, main, moon, or dawn
        dark_variant = "moon", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },

        palette = {
          -- Override the builtin palette per variant
        },

        -- NOTE: Highlight groups are extended (merged) by default. Disable this
        -- per group via `inherit = false`
        highlight_groups = {},

        before_highlight = function(group, highlight, palette) end,
      })

      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    enabled = false,
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "andromeda"
      vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    enabled = true,
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = false,
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    enabled = false,
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparent_background = false,
      })

      vim.cmd.colorscheme("monokai-pro")
    end,
  },
  {
    enabled = false,
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme miasma")
    end,
  },
  {
    enabled = false,
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    enabled = false,
    "uhs-robert/oasis.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oasis").setup()
      vim.cmd.colorscheme("oasis-night")
    end,
  },
}
