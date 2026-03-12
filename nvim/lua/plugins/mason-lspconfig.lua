return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_enable = true,
    ensure_installed = {
      "bashls",
      "cssls",
      "html",
      "lua_ls",
      "svelte",
      "ts_ls",
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
  },
}
