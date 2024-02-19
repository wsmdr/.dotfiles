local wezterm = require('wezterm')
local keys = require('keys.keys')
local ssh_domains = require('ssh_list')
local launch_menu = {}
local default_prog = {}

local config = {
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

  initial_cols = 150,
  initial_rows = 60,
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
  keys = keys,
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
    args = { "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe" }
  })
  table.insert(launch_menu, {
    label = 'CMD',
    args = { 'cmd.exe' }
  })
  table.insert(launch_menu, {
    label = 'Git Bash',
    args = { 'C:\\Program Files\\Git\\git-bash.exe' }
  })
  default_prog = { "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe" }

  config.default_prog = default_prog
  config.launch_menu = launch_menu
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

end

wezterm.log_error('Home ' .. wezterm.home_dir)

config.ssh_domains = ssh_domains



return config
