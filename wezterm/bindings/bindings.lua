local wezterm = require('wezterm')
local platform = require('utils.platform')()
local act = wezterm.action

local mod = {}

if platform.is_mac then
  mod.SUPER = 'SUPER'
elseif platform.is_win then
  mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
end

mod.SUPER_REV = 'SHIFT|CTRL'

local keys = {
  -- reload config
  { key = 'r', mods = mod.SUPER_REV, action = act.ReloadConfiguration, },
  -- F11 切换全屏
  { key = 'F11', mods = 'NONE', action = act.ToggleFullScreen },
  -- lanch menu
  { key = 'z', mods = 'ALT', action = act.ShowLauncher },
  -- Ctrl+Shift+N 新窗口
  { key = 'n', mods = mod.SUPER, action = act.SpawnWindow },
  -- Ctrl+Shift+T 新 tab
  { key = 't', mods = mod.SUPER, action = act.SpawnTab 'CurrentPaneDomain' },
  -- Ctrl+Shift+W 关闭 tab 且不进行确认
  { key = 'w', mods = mod.SUPER, action = act.CloseCurrentTab{ confirm = false } },
  -- 水平分割
  { key = 'h', mods = mod.SUPER_REV, action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'd', mods = 'CTRL', action = act.CloseCurrentPane { confirm = false }, },
  -- This will create a new split and run your default program inside it
  { key = 'd', mods = mod.SUPER_REV, action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
}

local mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
  -- Move mouse will only select text and not copy text to clipboard
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.SelectTextAtMouseCursor 'Cell',
 },
 -- right-click paste
 {
  event = {Down = {streak = 1, button = "Right"}},
  mods = "NONE",
  action = act.PasteFrom("Clipboard")
  },
}

return {
  keys = keys,
  mouse_bindings = mouse_bindings,
}
