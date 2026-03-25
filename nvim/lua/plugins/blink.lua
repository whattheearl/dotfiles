return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      menu = {
        auto_show = false,
      },
      documentation = {
        auto_show = false,
      }
    },
    keymap = {
      preset = 'default',
      ['<C-.>'] = { 'show', 'show_documentation', 'hide_documentation' },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
