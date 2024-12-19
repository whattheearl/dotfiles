-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  require 'custom.plugins.blink-cmp',
  require 'custom.plugins.harpoon',
  require 'custom.plugins.vim-tmux-navigator',
  spec = {
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    { import = 'lazyvim.plugins.extras.lang.svelte' },
    { import = 'plugins' },
  },
}
