return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-mini/mini.icons" },
  opts = {
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --glob '!package-lock.json' --glob '!*.age'"
    },
    files = {
      cwd_prompt = false,
      file_icons = false,
      winopts = {
        preview = {
          hidden = "hidden",
        },
      },
    },
  },
}
