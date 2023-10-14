local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- open wezterm in maximize mode
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "Ubuntu"

config.colors = {
  scrollbar_thumb = '#666',
}

-- use builtin window decoration
config.enable_scroll_bar = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Windows"
config.integrated_title_buttons = { 'Hide', 'Maximize', 'Close' }

-- quick keys
config.keys = {
  {key = '1', mods = 'ALT', action = act.ActivateTab(0)},
  {key = '2', mods = 'ALT', action = act.ActivateTab(1)},
  {key = '3', mods = 'ALT', action = act.ActivateTab(2)},
  {key = '4', mods = 'ALT', action = act.ActivateTab(3)},
  {key = '5', mods = 'ALT', action = act.ActivateTab(4)},
  {key = '6', mods = 'ALT', action = act.ActivateTab(5)},
  {key = '7', mods = 'ALT', action = act.ActivateTab(6)},
  {key = '8', mods = 'ALT', action = act.ActivateTab(7)},
  {key = '9', mods = 'ALT', action = act.ActivateTab(-1)},
}

-- disable merged non-equeal signs
config.harfbuzz_features = {'calt=0', 'clig=0', 'liga=0'}
-- disable font warning
config.warn_about_missing_glyphs = false
config.scrollback_lines = 8000
config.mouse_wheel_scrolls_tabs = false
config.selection_word_boundary = " \t\n{}[]()\"'`,;:"

return config
