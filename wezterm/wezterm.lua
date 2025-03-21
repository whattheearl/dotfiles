local wezterm = require("wezterm")
local config = {}

-- config.default_prog = { "/usr/bin/tmux", "new-session", "-A", "-s default" }
-- config.inherit_cwd = true
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

-- config.font_size = 8
config.font_size = 9
-- config.font_size = 10.5

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.warn_about_missing_glyphs = false

local function is_vim(pane)
    return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
}

local function split_nav(resize_or_move, key)
    return {
        key = key,
        mods = resize_or_move == "resize" and "META" or "CTRL",
        action = wezterm.action_callback(function(win, pane)
            if is_vim(pane) then
                -- pass the keys through to vim/nvim
                win:perform_action({
                    SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
                }, pane)
            else
                if resize_or_move == "resize" then
                    win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
                else
                    win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
                end
            end
        end),
    }
end

config.keys = {
    { key = "+", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    -- { key = "-", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "0", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "f", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "n", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "t", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
    { key = "1", mods = "CTRL", action = wezterm.action.ActivateTab(0) },
    { key = "2", mods = "CTRL", action = wezterm.action.ActivateTab(1) },
    { key = "3", mods = "CTRL", action = wezterm.action.ActivateTab(2) },
    { key = "4", mods = "CTRL", action = wezterm.action.ActivateTab(3) },
    { key = "5", mods = "CTRL", action = wezterm.action.ActivateTab(4) },
    { key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
    { key = "h", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
    { key = "l", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(1) },
    { key = "-", mods = "SUPER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "\\", mods = "SUPER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    split_nav("move", "h"),
    split_nav("move", "j"),
    split_nav("move", "k"),
    split_nav("move", "l"),
    -- { key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
    -- { key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
    -- { key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
    -- { key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
}

return config
