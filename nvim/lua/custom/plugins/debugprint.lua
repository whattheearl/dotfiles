return {
  'andrewferrier/debugprint.nvim',

  opts = {
    keymaps = {
      -- Set to false to disable the default keymap for specific actions
      -- insert_log_below = false,
      insert_log_below = 'glj',
      insert_log_above = 'glk',
      insert_plain_log_below = 'glo',
      insert_plain_log_above = 'gl<S-o>',
      insert_batch_log = 'glb',
      add_log_targets_to_batch = 'gla',
      insert_log_below_operator = 'g<S-l>j',
      insert_log_above_operator = 'g<S-l>k',
      insert_batch_log_operator = 'g<S-l>b',
      add_log_targets_to_batch_operator = 'g<S-l>a',
    },
  },

  dependencies = {
    'echasnovski/mini.nvim', -- Optional: Needed for line highlighting (full mini.nvim plugin)
    -- ... or ...
    'echasnovski/mini.hipatterns', -- Optional: Needed for line highlighting ('fine-grained' hipatterns plugin)

    'ibhagwan/fzf-lua', -- Optional: If you want to use the :SearchDebugPrints command with fzf-lua
    'nvim-telescope/telescope.nvim', -- Optional: If you want to use the :SearchDebugPrints command with telescope.nvim
    'folke/snacks.nvim', -- Optional: If you want to use the :SearchDebugPrints command with snacks.nvim
  },

  lazy = false, -- Required to make line highlighting work before debugprint is first used
  version = '*', -- Remove if you DON'T want to use the stable version
}
