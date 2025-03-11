return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- javascript = { "prettier" },
				-- typescript = { "prettier" },
				-- javascriptreact = { "prettier" },
				-- typescriptreact = { "prettier" },
				-- svelte = { "prettier" },
				-- css = { "prettier" },
				-- html = { "prettier" },
				-- json = { "prettier" },
				-- yaml = { "prettier" },
				-- markdown = { "prettier" },
				-- graphql = { "prettier" },
				-- liquid = { "prettier" },
				-- lua = { "stylua" },
				-- python = { "isort", "black" },
				-- cpp = { "clang-format" },
				-- c = { "clang-format" },
				lua = { "stylua", stop_after_first = true },
				python = { "black" },
				rust = { "rustfmt" },
				javascript = { "prettier", stop_after_first = true },
				javascriptreact = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				typescriptreact = { "prettier", stop_after_first = true },
				go = { "gofumpt", "golines", "goimports-reviser" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				haskell = { "ormolu" },
				yaml = { "yamlfmt" },
				-- templ = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				gleam = { "gleam" },
				-- sql = { "sqlfmt" },
				asm = { "asmfmt" },
				css = { "prettier", stop_after_first = true },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				if vim.g.disable_autoformat then
					return
				end
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
