local wezterm = require("wezterm")
local config = {}

config.default_prog = { "tmux" }
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.warn_about_missing_glyphs = false
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Google Dark (Gogh)"

return config
