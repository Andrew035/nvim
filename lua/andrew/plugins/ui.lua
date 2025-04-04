return {
	{
		"nvimdev/dashboard-nvim",
		enabled = false,
	},

	-- filename
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		config = function()
			-- local colors = require("catppuccin.palettes.mocha")
			require("incline").setup({
				highlight = {
					groups = {
						-- catppuccin
						-- InclineNormal = { guibg = nil, guifg = colors.lavender },
						-- InclineNormalNC = { guifg = colors.green, guibg = nil },
						-- rose pine
						InclineNormal = { guibg = nil, guifg = "##e0def4" },
						InclineNormalNC = { guifg = "#9ccfd8", guibg = nil },
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
