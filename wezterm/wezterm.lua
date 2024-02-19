local wezterm = require('wezterm')
local keys = require('keys.keys')
local ssh_domains = require 'ssh_list'
local launch_menu = {}
local default_prog = {}

local ssh_cmd = { "ssh" }
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(launch_menu, {
    label = 'PowerShell-NewWindow',
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
elseif wezterm.target_triple == "x86_64-apple-darwin" then

elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then

end



local config = {
  check_for_updates = false,
  switch_to_last_active_tab_when_closing_tab = false,
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

  font = wezterm.font 'Hack Nerd Font Mono',
  color_scheme = 'Dracula (Official)',
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
  window_close_confirmation = "NeverPrompt",
  default_prog = default_prog,
  launch_menu = launch_menu,
  keys = keys,
}
wezterm.log_error('Home ' .. wezterm.home_dir)

return config
