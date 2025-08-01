local wezterm = require("wezterm")
local config = {}

-- config.color_scheme = "Matrix (terminal.sexy)"
-- config.color_scheme = "HaX0R_GR33N"
-- config.color_scheme = "Grayscale Dark (base16)"
-- config.color_scheme = "Gruber (base16)"
-- config.color_scheme = "Greenscreen (dark) (terminal.sexy)"
--
if wezterm.target_triple == "aarch64-apple-darwin" then
  -- osx
  config.font_size = 14.0
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  -- ws
  config.font = wezterm.font_with_fallback({
    "Fira Code Nerd Font Mono",
    "JetBrains Mono",
    "Symbols Nerd Font",
  })
  config.font_size = 9
elseif wezterm.target_triple == "aarch64-unknown-linux-gnu" then
  -- asahi fedora
  config.font = wezterm.font_with_fallback({
    "Fira Code",
  })
  config.font_size = 11
end

config.hide_tab_bar_if_only_one_tab = true
config.keys = {
  { key = "+", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
  { key = "-", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
  { key = "0", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
  { key = "f", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
  {
    key = "f",
    mods = "CTRL",
    action = wezterm.action.SendString("\x15\n. ${HOME}/wte/dotfiles/scripts/folder-picker.sh\n"),
  },
  {
    key = "f",
    mods = "SUPER",
    action = wezterm.action.SendString("\x15\n. ${HOME}/wte/dotfiles/scripts/folder-picker.sh\n"),
  },
  { key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
  { key = "w", mods = "SUPER", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
  { mods = "CTRL|SHIFT", key = "d", action = wezterm.action.ShowDebugOverlay },
}
config.skip_close_confirmation_for_processes_named = { "*" }
config.warn_about_missing_glyphs = false
config.window_close_confirmation = "NeverPrompt"
config.window_padding = { left = 4, right = 0, top = 0, bottom = 0 }

return config
