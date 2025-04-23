vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("lazy-bootstrap")
require("lazy-plugins")
require("keymaps")
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/jon/.config/nvim/snippets" } })
