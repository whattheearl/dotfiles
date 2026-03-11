-- global setting
vim.g.have_nerd_font = false
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- settings
vim.o.breakindent = true
vim.o.confirm = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.inccommand = 'split'
vim.o.list = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- keymap
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>sg', ':FzfLua live_grep<CR>', { desc = 'Search grep.' })
vim.keymap.set('n', '<leader>sb', ':FzfLua buffers<CR>', { desc = 'Search files.' })
vim.keymap.set('n', '<leader>sf', ':FzfLua files<CR>', { desc = 'Search files.' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- autocommands
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "/home/jon/wte/notes/*",
  callback = function()
    vim.fn.system("cd /home/jon/wte/notes && git add -A && git commit -m 'autocmd'");
   local result = vim.fn.system("cd /home/jon/wte/notes && git -C /home/jon/wte/notes pull --rebase")
    if vim.v.shell_error ~= 0 and not result:find("Already up to date.") then
      vim.notify("Git pull failed: " .. result, vim.log.levels.WARN)
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "/home/jon/wte/notes/*",
  callback = function()
    local output = vim.fn.system("git -C /home/jon/wte/notes add -A && git -C /home/jon/wte/notes commit -m 'autocmd' && git -C /home/jon/wte/notes push")
    if vim.v.shell_error ~= 0 and not output:find("Your branch is up to date") then
      print("git push failed: " .. vim.v.shell_error)
      print("Output: " .. output)
    end
  end,
})

-- diagnostics
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text = false, -- Text shows up at the end of the line
  virtual_lines = true, -- Text shows up underneath the line, with virtual lines
  jump = { float = true },
}

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = false },
})

require('nvim-treesitter').install({
  'bash',
  'c',
  'css',
  'diff',
  'html',
  'javascript',
  'lua',
  'luadoc',
  'make',
  'markdown',
  'markdown_inline',
  'query',
  'svelte',
  'typescript',
  'vim',
  'vimdoc',
})

-- vim: ts=2 sts=2 sw=2 et
