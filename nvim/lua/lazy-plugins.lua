require("lazy").setup({
    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.indent_line',
    -- require 'kickstart.plugins.lint',
    require("kickstart.plugins.autopairs"),
    require("kickstart.plugins.conform"),
    require("kickstart.plugins.gitsigns"),
    require("kickstart.plugins.lazydev"),
    require("kickstart.plugins.luvit-meta"),
    require("kickstart.plugins.mini"),
    require("kickstart.plugins.neo-tree"),
    require("kickstart.plugins.nvim-lspconfig"),
    require("kickstart.plugins.telescope"),
    require("kickstart.plugins.todo-comments"),
    -- require("kickstart.plugins.tokyonight"),
    {
        "xero/evangelion.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("evangelion")
        end,
    },
    require("kickstart.plugins.treesitter"),
    require("kickstart.plugins.vim-sleuth"),
    require("kickstart.plugins.whichkey"),

    { import = "custom.plugins" },
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
