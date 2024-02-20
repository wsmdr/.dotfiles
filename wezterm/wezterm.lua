local wezterm = require('wezterm')
local bindings = require('bindings.bindings')
local ssh_domains = require('ssh_list')
local launch_menu = {}
local default_prog = {}

local config = {
  background = {
    {
      source = { File = wezterm.config_dir .. "/background.jpg"},
      attachment = 'Fixed',
      opacity = 1.0,
    },
  },
  term = "xterm-256color",
  front_end = 'WebGpu',
  webgpu_power_preference = 'HighPerformance',
  check_for_updates = false,
  enable_scroll_bar = true,
  skip_close_confirmation_for_processes_named = {
    'bash',
    'sh',
    'zsh',
    'fish',
    'tmux',
    'nu',
    'cmd.exe',
    'pwsh.exe',
    'powershell.exe',
  },

  initial_cols = 130,
  initial_rows = 40,
  font = wezterm.font 'Hack Nerd Font Mono',
  color_scheme = 'Dracula (Official)',
  font_size = 13,
  colors = {
    -- 被选中的内容的背景色
    selection_bg = '#D0AB52'
  },
  native_macos_fullscreen_mode = true,
  adjust_window_size_when_changing_font_size = true,
  window_background_opacity = 0.96,
  window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5
  },
  window_frame = {
    inactive_titlebar_bg = '#353535',
    active_titlebar_bg = '#2b2042',
    inactive_titlebar_fg = '#cccccc',
    active_titlebar_fg = '#ffffff',
    inactive_titlebar_border_bottom = '#2b2042',
    active_titlebar_border_bottom = '#2b2042',
    button_fg = '#cccccc',
    button_bg = '#2b2042',
    button_hover_fg = '#ffffff',
    button_hover_bg = '#3b3052',
  },
  window_close_confirmation = "NeverPrompt",
  -- default_prog = default_prog,
  -- launch_menu = launch_menu,
  keys = bindings.keys,
  mouse_bindings = bindings.mouse_bindings,
  -- tab bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = true,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = true,
  switch_to_last_active_tab_when_closing_tab = true,
  -- cursor
  default_cursor_style = "BlinkingBlock",
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",
  cursor_blink_rate = 700,
}

local ssh_cmd = { "ssh" }
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }
  })
  table.insert(launch_menu, {
    label = 'CMD',
    args = { 'cmd.exe' }
  })
  table.insert(launch_menu, {
    label = 'Git Bash',
    args = { 'C:\\Program Files\\Git\\git-bash.exe' }
  })
  default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }

  config.default_prog = default_prog
  config.launch_menu = launch_menu

  table.insert(bindings.keys, {
    key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom('Clipboard') 
  })
elseif wezterm.target_triple == "x86_64-apple-darwin" then
  -- default_prog = { '/bin/zsh' }
  table.insert(launch_menu, {
    label = 'Zsh',
    args = { 'zsh' },
  })
  table.insert(launch_menu, {
    label = 'Bash',
    args = { 'bash' },
  })

  config.launch_menu = launch_menu
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  table.insert(bindings.keys, {
    key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom('Clipboard') 
  })
end

wezterm.log_error('Home ' .. wezterm.home_dir)

config.ssh_domains = ssh_domains

local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#0b0022'
    local background = '#1b1032'
    local foreground = '#808080'

    if tab.is_active then
      background = '#2b2042'
      foreground = '#c0c0c0'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

wezterm.on(
  "update-right-status",
  function(window)
    local date = wezterm.strftime("%Y-%m-%d %H:%M:%S ")
    window:set_right_status(
      wezterm.format(
        {
          { Text = date }
        }
      )
    )
  end
)

return config
