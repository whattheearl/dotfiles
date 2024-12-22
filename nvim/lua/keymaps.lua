-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- move between tabs
vim.keymap.set("n", "<A-1>", "1gt", { noremap = true })
vim.keymap.set("n", "<A-2>", "2gt", { noremap = true })
vim.keymap.set("n", "<A-3>", "3gt", { noremap = true })
vim.keymap.set("n", "<A-4>", "4gt", { noremap = true })
vim.keymap.set("n", "<A-5>", "5gt", { noremap = true })
vim.keymap.set("n", "<leader>1", "1gt", { noremap = true })
vim.keymap.set("n", "<leader>2", "2gt", { noremap = true })
vim.keymap.set("n", "<leader>3", "3gt", { noremap = true })
vim.keymap.set("n", "<leader>4", "4gt", { noremap = true })
vim.keymap.set("n", "<leader>5", "5gt", { noremap = true })
vim.keymap.set("n", "<leader>j", "1gt", { noremap = true })
vim.keymap.set("n", "<leader>k", "2gt", { noremap = true })
vim.keymap.set("n", "<leader>l", "3gt", { noremap = true })
vim.keymap.set("n", "<leader>;", "4gt", { noremap = true })
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<C-c>", ":tabclose<CR>", { noremap = true })

vim.keymap.set("n", "<leader>et", ":tabnew ~/wte/notes/today.md<CR>", { noremap = true })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
