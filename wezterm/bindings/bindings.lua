local wezterm = require('wezterm')
local platform = require('utils.platform')()
local act = wezterm.action

local mod = {}

if platform.is_mac then
  mod.SUPER = 'SUPER'
  mod.SUPER_REV = 'SUPER|CTRL'
elseif platform.is_win then
  mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
  mod.SUPER_REV = 'ALT|CTRL'
end


local keys = {
  -- lanch menu
  { key = 'z', mods = 'ALT', action = wezterm.action.ShowLauncher },


  { key = 'LeftArrow', mods = mod.SUPER, action = act.AdjustPaneSize({ 'Left', 1 }) },
  { key = 'RightArrow', mods = mod.SUPER, action = act.AdjustPaneSize({ 'Right', 1 }) },

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
}

return {
  keys = keys,
  mouse_bindings = mouse_bindings,
}
