require('helpers.utils')

local dsp_exec_cmd = hl.dsp.exec_cmd
local window = hl.dsp.window
---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"
local secondMod = "ALT"
local terminal = "alacritty"
local fileManager = "pcmanfm-qt"
local menu = "hyprlauncher"

---@alias BindingGroup { mod: string, bindings: Binding[] }
---@type BindingGroup[]
local binding_groups = {
  {
    mod = mainMod,
    bindings = {
      { keys = "B",          command = window.cycle_next() },
      { keys = "Q",          command = window.kill() },
      { keys = "SHIFT + Q",  command = dsp_exec_cmd("hyprctl dispatch exit") },
      { keys = "T",          command = window.float({ action = "toggle" }) },
      { keys = "P",          command = window.pseudo() },
      { keys = "SHIFT + P",  command = dsp_exec_cmd("hyprctl dispatch exec kanshi") },
      { keys = "ALT + L",    command = dsp_exec_cmd("wlogout") },
      { keys = "M",          command = dsp_exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit") },
      { keys = "Return",     command = dsp_exec_cmd(terminal) },
      { keys = "E",          command = dsp_exec_cmd(fileManager) },
      { keys = "R",          command = dsp_exec_cmd(menu) },
      -- focus
      { keys = "h",          command = MoveFocus("left") },
      { keys = "l",          command = MoveFocus("right") },
      { keys = "k",          command = MoveFocus("up") },
      { keys = "j",          command = MoveFocus("down") },
      -- focus
      { keys = "SHIFT + h",  command = MoveWorkSpace("left") },
      { keys = "SHIFT + l",  command = MoveWorkSpace("right") },
      { keys = "SHIFT + k",  command = MoveWorkSpace("up") },
      { keys = "SHIFT + j",  command = MoveWorkSpace("down") },
      -- mouse
      { keys = "mouse_down", command = hl.dsp.focus({ workspace = "e+1" }) },
      { keys = "mouse_up",   command = hl.dsp.focus({ workspace = "e-1" }) },
      { keys = "mouse:272",  command = window.drag(),                                                                                   opts = { mouse = true } },
      { keys = "mouse:273",  command = window.resize(),                                                                                 opts = { mouse = true } },
      { keys = "space",      command = window.fullscreen({ mode = "maximized" }) },
    }
  },
  {
    mod = secondMod,
    bindings = {
      { keys = "Tab",   command = window.cycle_next() },
      { keys = "L",     command = window.fullscreen },
      { keys = "F4",    command = window.kill },
      { keys = "Space", command = dsp_exec_cmd('rofi -show combi -combi-modes "window,drun,ssh" -modes combi -display-drun "" -show-icons') },
    }
  },
  {
    mod = "",
    bindings = {
      { keys = "Print",                 command = dsp_exec_cmd("XDG_CURRENT_DESKTOP=sway flameshot gui"),         opts = { locked = true, repeating = true } },
      { keys = "XF86AudioRaiseVolume",  command = dsp_exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), opts = { locked = true, repeating = true } },
      { keys = "XF86AudioLowerVolume",  command = dsp_exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      opts = { locked = true, repeating = true } },
      { keys = "XF86AudioMute",         command = dsp_exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     opts = { locked = true, repeating = true } },
      { keys = "XF86AudioMicMute",      command = dsp_exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   opts = { locked = true, repeating = true } },
      { keys = "XF86MonBrightnessUp",   command = dsp_exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  opts = { locked = true, repeating = true } },
      { keys = "XF86MonBrightnessDown", command = dsp_exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  opts = { locked = true, repeating = true } },
      { keys = "XF86AudioNext",         command = dsp_exec_cmd("playerctl next"),                                 opts = { locked = true } },
      { keys = "XF86AudioPause",        command = dsp_exec_cmd("playerctl play-pause"),                           opts = { locked = true } },
      { keys = "XF86AudioPlay",         command = dsp_exec_cmd("playerctl play-pause"),                           opts = { locked = true } },
      { keys = "XF86AudioPrev",         command = dsp_exec_cmd("playerctl previous"),                             opts = { locked = true } },
    }
  }
}

-- register all groups
for _, group in ipairs(binding_groups) do
  for _, binding in ipairs(group.bindings) do
    BindKey(group.mod, binding)
  end
end

-- workspace bindings
for i = 1, 10 do
  local key = tostring(i % 10)
  BindKey(mainMod, { keys = key, command = hl.dsp.focus({ workspace = i }) })
  BindKey(mainMod .. "+SHIFT", { keys = key, command = hl.dsp.window.move({ workspace = i }) })
end
