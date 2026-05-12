return {
	-- "numToStr/Comment.nvim",
	-- -- opts = {},
	-- event = { "BufReadPre", "BufNewFile" },
	-- config = function()
	-- 	local ft = require("Comment.ft")
	-- 	require("Comment").setup({})
	-- 	ft.set("python", "#%s", '"""%s"""').set("javascript", { "//#s", "/*%s*/" })
	-- 	ft.conf = "#%s"
	-- end,
	"nvim-mini/mini.comment",
	version = "*",
	config = function()
		local mini_comment = require("mini.comment")

		mini_comment.setup({
			options = {
				ignore_blank_line = false,
			},
			mappings = {
				comment = "gc",
				comment_line = "gcc",
				comment_visual = "gc",
				textobject = "gc",
			},
			hooks = {
				pre = function() end,
				post = function() end,
			},
		})
	end,
}
