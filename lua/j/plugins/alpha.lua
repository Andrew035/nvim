return {
	"goolord/alpha-nvim",
	event = "VimEnter", -- Only load on startup
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		----------------------------------------------------------
		-- 1. HEADER (Pure ASCII, Sleek & Modern)
		----------------------------------------------------------
		dashboard.section.header.val = {
			[[                               __                ]],
			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			[[                                                 ]],
		}

		----------------------------------------------------------
		-- 2. BUTTONS (Pure ASCII to match)
		----------------------------------------------------------
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find Files", "<cmd>Telescope find_files<cr>"),
			dashboard.button("g", "  Find Word", "<cmd>Telescope live_grep<cr>"),
			dashboard.button("n", "  New File", "<cmd>enew<cr>"),
			dashboard.button("u", "  Sync Plugins", "<cmd>Lazy sync<cr>"),
			dashboard.button("q", "  Exit Neovim", "<cmd>qa<cr>"),
		}

		----------------------------------------------------------
		-- 3. FOOTER (Placeholder, updated dynamically below)
		----------------------------------------------------------
		dashboard.section.footer.val = {
			"",
			"Loading system stats...",
		}

		----------------------------------------------------------
		-- 4. LAYOUT / CENTERING
		----------------------------------------------------------
		dashboard.config.layout = {
			{ type = "padding", val = 10 },
			dashboard.section.header,
			{ type = "padding", val = 3 },
			dashboard.section.buttons,
			{ type = "padding", val = 5 },
			dashboard.section.footer,
		}

		----------------------------------------------------------
		-- 5. HIGHLIGHTING (COLORS)
		----------------------------------------------------------
		dashboard.section.header.opts.hl = "Function"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.section.footer.opts.hl = "Comment"

		-- Hide the statusline and tabline on the dashboard buffer
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.opt_local.statusline = " "
				vim.opt_local.showtabline = 0
			end,
		})

		----------------------------------------------------------
		-- 6. STARTUP TIME CALCULATION
		----------------------------------------------------------
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
				dashboard.section.footer.val = {
					"",
					"Loaded " .. stats.count .. " plugins in " .. ms .. "ms",
				}
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		alpha.setup(dashboard.config)
	end,
}
