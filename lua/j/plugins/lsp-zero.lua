return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		-- lazy = false,
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"saadparwaiz1/cmp_luasnip",
					"rafamadriz/friendly-snippets",
				},
			},
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				formatting = lsp_zero.cmp_format({ details = true }),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			--- if you want to know more about lsp-zero and mason.nvim
			--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })

				-- lsp_zero.buffer_autoformat()
			end)

			vim.diagnostic.config({
				signs = false,
				virtual_text = true,
				severity_sort = true,
			})
			-- Intercept and filter Pyright's diagnostics
			local default_diagnostic_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
			vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
				local client = vim.lsp.get_client_by_id(ctx.client_id)

				-- Only apply this filter to Pyright
				if client and client.name == "pyright" then
					local filtered_diagnostics = {}
					for _, diagnostic in ipairs(result.diagnostics) do
						-- Pyright uses the phrase "is not accessed" for all unused imports/variables
						if not diagnostic.message:match("is not accessed") then
							table.insert(filtered_diagnostics, diagnostic)
						end
					end
					result.diagnostics = filtered_diagnostics
				end

				-- Pass the filtered results back to Neovim to display
				default_diagnostic_handler(err, result, ctx, config)
			end
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "pyright", "ruff", "lua_ls" }, -- Ensure tsserver is installed
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,

					-- this is the "custom handler" for `lua_ls`
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
					tsserver = function()
						require("lspconfig").tsserver.setup({
							on_attach = function(client, bufnr)
								-- Add any specific settings for tsserver here
								lsp_zero.default_keymaps({ buffer = bufnr })
							end,
						})
					end,
					-- pyright = function()
					-- 	require("lspconfig").pyright.setup({
					-- 		settings = {
					-- 			pyright = {
					-- 				disableOrganizeImports = true,
					-- 			},
					-- 			python = {
					-- 				analysis = {
					-- 					diagnosticSeverityOverrides = {
					-- 						reportUnusedImport = "none",
					-- 						reportUnusedVariable = "none",
					-- 						reportDuplicateImport = "none",
					-- 					},
					-- 				},
					-- 			},
					-- 		},
					-- 	})
					-- end,
				},
			})
		end,
	},
}
