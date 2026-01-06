-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

-- CodeCompanion
-- vim.keymap.set("n", "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle CodeCompanion Chat" })
-- vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })

keymap.set("n", "<C-n>", "<c-p>")
keymap.set("i", "<C-n>", "<c-p>")

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights " })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Move things in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor stays in place on J
keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle on C-D C-U and remap to ctrl j-k
keymap.set("n", "<C-j>", "<C-d>zz")
keymap.set("n", "<C-k>", "<C-u>zz")

-- Keep cursor in the middle on n
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- When pasting over something, don't lose register
keymap.set("x", "<leader>p", '"_dP')

-- Navigate vim panes better
-- keymap.set("n", "<c-k>", ":wincmd k<CR>")
-- keymap.set("n", "<c-j>", ":wincmd j<CR>")
-- keymap.set("n", "<c-h>", ":wincmd h<CR>")
-- keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>C", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
