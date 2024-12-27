local wezterm = require("wezterm")
local config = {}

config.default_prog = { "/usr/bin/tmux", "new-session", "-A", "-s default" }
config.debug_key_events = true

config.hide_tab_bar_if_only_one_tab = true

config.font_size = 9.8

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.warn_about_missing_glyphs = false

config.keys = {
    { key = "-", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "+", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "t", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "0", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "n", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "f", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "Tab", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
}

config.skip_close_confirmation_for_processes_named = { "flatpak-spawn", "bash", "sh", "zsh", "tmux" }

return config
