local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- open wezterm in maximize mode
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- WSL Settings
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_domain = 'WSL:Ubuntu'
end
config.wsl_domains = {
  {
    name = 'WSL:Ubuntu',
    distribution = 'Ubuntu',
    default_cwd = '~',
  },
}
-- WSL Settings end

config.color_scheme = 'Ubuntu'

config.colors = {
  scrollbar_thumb = '#666',
  tab_bar = {
    active_tab = {
      bg_color = '#300a24',
      fg_color = '#c0c0c0',
    },
    inactive_tab_edge = '#300a24',
  },
}

-- use builtin window decoration
config.enable_scroll_bar = true
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.integrated_title_button_style = 'Windows'
config.integrated_title_buttons = {'Hide', 'Maximize', 'Close'}

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
  {key = '1', mods = 'CTRL|ALT', action = act.MoveTab(0)},
  {key = '2', mods = 'CTRL|ALT', action = act.MoveTab(1)},
  {key = '3', mods = 'CTRL|ALT', action = act.MoveTab(2)},
  {key = '4', mods = 'CTRL|ALT', action = act.MoveTab(3)},
  {key = '5', mods = 'CTRL|ALT', action = act.MoveTab(4)},
  {key = '6', mods = 'CTRL|ALT', action = act.MoveTab(5)},
  {key = '7', mods = 'CTRL|ALT', action = act.MoveTab(6)},
  {key = '8', mods = 'CTRL|ALT', action = act.MoveTab(7)},
  {key = '9', mods = 'CTRL|ALT', action = act.MoveTab(8)},
  {key = '[', mods = 'CTRL|ALT', action = act.MoveTabRelative(-1)},
  {key = ']', mods = 'CTRL|ALT', action = act.MoveTabRelative(1)},
  {key = 'F9', mods = 'SHIFT', action = act.PasteFrom 'PrimarySelection'},
  {key = 'l', mods = 'CTRL', action = wezterm.action_callback(function(window, pane)
    -- scroll to bottom in case you aren't already
    window:perform_action(wezterm.action.ScrollToBottom, pane)

    -- avoid running in tui programs like vim that don't have scrollback
    if pane:is_alt_screen_active() then
      return
    end

    -- get the current height of the viewport
    local height = pane:get_dimensions().viewport_rows

    -- build a string of new lines equal to the viewport height
    local blank_viewport = string.rep('\r\n', height)

    -- inject those new lines to push the viewport contents into the scrollback
    pane:inject_output(blank_viewport)

    -- send an escape sequence to clear the viewport (CTRL-L)
    pane:send_text('\x0c')
  end)},
}

-- ctrl-click to open links
config.mouse_bindings = {
  -- Click to select text
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },
  -- CTRL-Click to open links
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
  -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.Nop,
  },
  -- Right click to paste
  {
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act({ PasteFrom = "Clipboard" }),
	},
}

-- disable ligatures
config.harfbuzz_features = {'calt=0', 'clig=0', 'liga=0'}
-- disable font warning
config.warn_about_missing_glyphs = false
config.scrollback_lines = 10000
config.mouse_wheel_scrolls_tabs = false
config.selection_word_boundary = ' \t\n{}[]()"\'`,;:=$'

return config
