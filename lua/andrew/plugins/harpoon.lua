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

		-- picker
		local function generate_harpoon_picker()
			local file_paths = {}
			for _, item in ipairs(harpoon:list().items) do
				table.insert(file_paths, {
					text = item.value,
					file = item.value,
				})
			end
			return file_paths
		end

		vim.keymap.set("n", "<leader>fh", function()
			Snacks.picker({
				finder = generate_harpoon_picker,
				win = {
					input = {
						keys = {
							["dd"] = { "harpoon_delete", mode = { "n", "x" } },
						},
					},
					list = {
						keys = {
							["dd"] = { "harpoon_delete", mode = { "n", "x" } },
						},
					},
				},
				actions = {
					harpoon_delete = function(picker, item)
						local to_remove = item or picker:selected()
						table.remove(harpoon:list().items, to_remove.idx)
						picker:find({
							refresh = true,
						})
					end,
				},
			})
		end)

		-- basic telescope configuration
		-- local conf = require("telescope.config").values
		-- local function toggle_telescope(harpoon_files)
		-- 	local file_paths = {}
		-- 	for _, item in ipairs(harpoon_files.items) do
		-- 		table.insert(file_paths, item.value)
		-- 	end
		--
		-- 	require("telescope.pickers")
		-- 		.new({}, {
		-- 			prompt_title = "Harpoon",
		-- 			finder = require("telescope.finders").new_table({
		-- 				results = file_paths,
		-- 			}),
		-- 			previewer = conf.file_previewer({}),
		-- 			sorter = conf.generic_sorter({}),
		-- 		})
		-- 		:find()
		-- end
		--
		-- vim.keymap.set("n", "<leader>sn", function()
		-- 	toggle_telescope(harpoon:list())
		-- end, { desc = "Open harpoon window" })
	end,
}
