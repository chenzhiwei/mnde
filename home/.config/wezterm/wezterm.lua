local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return {
  color_scheme = "Ubuntu",
  warn_about_missing_glyphs = false,
  keys = {
    {key = '1', mods = 'ALT', action = act.ActivateTab(0)},
    {key = '2', mods = 'ALT', action = act.ActivateTab(1)},
    {key = '3', mods = 'ALT', action = act.ActivateTab(2)},
    {key = '4', mods = 'ALT', action = act.ActivateTab(3)},
    {key = '5', mods = 'ALT', action = act.ActivateTab(4)},
    {key = '6', mods = 'ALT', action = act.ActivateTab(5)},
    {key = '7', mods = 'ALT', action = act.ActivateTab(6)},
    {key = '8', mods = 'ALT', action = act.ActivateTab(7)},
    {key = '9', mods = 'ALT', action = act.ActivateTab(-1)},
  },
}
