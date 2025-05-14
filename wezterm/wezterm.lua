local wezterm = require("wezterm")
local config = {}

config.confirm_close_tab = false
config.hide_tab_bar_if_only_one_tab = true
config.warn_about_missing_glyphs = false
config.window_close_confirmation = "NeverPrompt"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

if wezterm.target_triple == "aarch64-apple-darwin" then
  config.font_size = 14.0
else
  config.font_size = 9
  config.font = wezterm.font_with_fallback({
    "Fira Code Nerd Font Mono",
    "JetBrains Mono",
    "Symbols Nerd Font",
  })
end

config.keys = {
  { key = "+", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
  -- { key = "-", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
  { key = "0", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
  { key = "f", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
  { key = "n", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
  { key = "t", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
}

return config
