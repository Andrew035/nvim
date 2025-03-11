return {
	{
		"nvimdev/dashboard-nvim",
		enabled = false,
	},

	-- buffer line
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	version = "*",
	-- 	opts = {
	-- 		options = {
	-- 			mode = "tabs",
	-- 			show_buffer_close_icons = false,
	-- 			show_close_icon = false,
	-- 			themeable = true,
	-- 		},
	-- 	},
	-- },

	-- filename
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local colors = require("catppuccin.palettes.mocha")
			-- local colors = require("solarized-osaka.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						-- solarized osaka
						-- InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
						-- InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
						-- catppuccin
						InclineNormal = { guibg = colors.base, guifg = colors.lavender },
						InclineNormalNC = { guifg = colors.green, guibg = colors.base },
						-- tokyonight (josean)
						-- InclineNormal = { guibg = "#011628", guifg = "#cbe0f0" },
						-- inclineNormalNC = { guifg = "#3effdc", guibg = "#011628" },
						-- tokyonight (normal)
						-- InclineNormal = { guibg = "#1a1b26", guifg = "#c0caf5" },
						-- inclineNormalNC = { guifg = "#4bd6be", guibg = "#1a1b26" },
						-- nordic
						-- InclineNormal = { guibg = "#242933", guifg = "#d8dee9" },
						-- inclineNormalNC = { guifg = "#b1c89d", guibg = "#242933" },
						-- solarized-osaka
						-- InclineNormal = { guibg = colors.base04, guifg = colors.base4 },
						-- inclineNormalNC = { guifg = colors.violet500, guibg = colors.base04 },
						-- gruvbox material
						-- InclineNormal = { guibg = "#3c3836", guifg = "#8ec07c" },
						-- inclineNormalNC = { guifg = "#4bd6be", guibg = "#458588" },
						-- everforest
						-- InclineNormal = { guibg = "#272e33", guifg = "#8ec07c" },
						-- InclineNormalNC = { guibg = "#272e33", guifg = "#8ec07c" },
						-- rose-pine
						-- inclineNormal = { guifg = "#eb6f92", guibg = "#232136" },
						-- inclineNormalNC = { guifg = "#3e8fb0", guibg = "#232136" },
						-- black metal
						-- inclineNormal = { guifg = "#dadada", guibg = "" },
						-- inclineNormalNC = { guifg = "#8ccf7e", guibg = "" },
					},
				},
				window = { margin = { vertical = 2, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end
					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},
	-- LazyGit integration with Telescope
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{
				";c",
				":LazyGit<Return>",
				silent = true,
				noremap = true,
			},
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
		keys = {
			{

				"<leader>d",
				"<cmd>NvimTreeClose<cr><cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>",
			},
		},
	},
	{
		enabled = false,
		"nvim-tree/nvim-tree.lua",
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			require("nvim-tree").setup({
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")

					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					-- default mappings
					api.config.mappings.default_on_attach(bufnr)

					-- custom mappings
					-- vim.keymap.set("n", "t", api.node.open.tab, opts("Tab"))
				end,
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
					relativenumber = false,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
					custom = {
						"node_modules/.*",
						".DS_Store",
					},
					-- custom = { ".DS_Store" },
				},
				log = {
					enable = true,
					truncate = true,
					types = {
						diagnostics = true,
						git = true,
						profile = true,
						watcher = true,
					},
				},
				git = {
					ignore = false,
				},
			})

			if vim.fn.argc(-1) == 0 then
				vim.cmd("NvimTreeFocus")
			end

			vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		end,
	},
}
