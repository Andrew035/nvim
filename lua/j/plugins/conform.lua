return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			-- ruff_fix handles things like unused imports (linting rules)
			-- ruff_format perfectly replaces black for code styling
			-- ruff_organize_imports perfectly replaces isort
			python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
			html = { "prettier" },
			typescript = { "prettier" },
			javascript = { "prettier" },
			css = { "prettier" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			sql = { "pgformatter" },
			asm = { "asmfmt" },
		},
		format_on_save = {
			timeout_ms = 1000, -- Ruff is so fast it won't need this, but good to have
			lsp_fallback = true,
		},
	},
}
