return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local toggle_opts = {
			border = "rounded",
			title_pos = "left",
			ui_width_ratio = 0.62569,
		}

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
		end)

		vim.keymap.set("n", "<S-h>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<S-l>", function()
			harpoon:list():next()
		end)

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>fh", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
