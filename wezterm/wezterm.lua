local wezterm = require('wezterm')

local config = {
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
  window_background_opacity = 0.96,
}
local ssh_cmd = {"ssh"}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then

elseif wezterm.target_triple == "x86_64-apple-darwin" then

elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then

end
wezterm.log_error('Home ' .. wezterm.home_dir)

return config
