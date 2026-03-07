return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'angular',
        'bash',
        'c',
        'c_sharp',
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
        'scss',
        'svelte',
        'typescript',
        'vim',
        'vimdoc',
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
        pattern = { '*.component.html', '*.container.html' },
        callback = function()
          vim.treesitter.start(nil, 'angular')
        end,
      }),
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
