return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opt = {
    highlight = { enable = true },
  },
}
