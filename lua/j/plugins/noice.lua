return {
	"folke/noice.nvim",
	event = "VeryLazy", -- Keeps your startup time insanely fast
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				stages = "static", -- No heavy animations, notifications instantly appear
				render = "compact", -- Sleek, minimalist text-only notifications
				timeout = 2500, -- Disappear quickly after 2.5 seconds
				max_width = 50, -- Keep the notification boxes small and tidy
			},
		},
	},
	opts = {
		lsp = {
			-- Override markdown rendering so that cmp and other plugins use Treesitter
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true, -- Keep search (/) at the bottom, not in the middle of the screen
			command_palette = true, -- The sleek centered popup for commands (:)
			long_message_to_split = true, -- Long error messages go to a split, not a massive popup
			inc_rename = false,
			lsp_doc_border = true, -- Adds clean borders to hover docs
		},
		routes = {
			-- SILENCE ANNOYING MESSAGES
			-- This makes Noice feel much more minimal by hiding standard vim messages
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" }, -- "written" messages
						{ find = "; before #" }, -- undo/redo messages
						{ find = "%d fewer lines" }, -- delete messages
						{ find = "%d more lines" }, -- paste messages
						{ find = "yanked" }, -- yank messages
					},
				},
				opts = { skip = true }, -- Do not show them at all
			},
		},
		views = {
			cmdline_popup = {
				position = {
					row = "30%",
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = "40%",
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
	},
}
