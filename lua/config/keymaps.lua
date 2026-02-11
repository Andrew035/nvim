vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", ";nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Save file and quit
keymap.set("n", ";w", ":update<Return>", opts)
keymap.set("n", ";q", ":quit<Return>", opts)
keymap.set("n", ";Q", ":qa<Return>", opts)

-- Tab and Text Manipulation
keymap.set("n", "L", ":bnext<Return>", opts)
keymap.set("n", "H", ":bprev<Return>", opts)
keymap.set("v", "J", ":m '>+1<cr>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<cr>gv=gv", opts)

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split rindor vertically" }) -- split windo; vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
