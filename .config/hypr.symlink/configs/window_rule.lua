--- @type HL.WindowRuleSpec
local window_rules = {
  {
    name        = "no-gaps-wtv1",
    match       = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding    = 0,
  },
  {
    name        = "no-gaps-f1",
    match       = { float = false, workspace = "f[1]" },
    border_size = 0,
    rounding    = 0,
  },

  {
    --# Ignore maximize requests from all apps. You'll probably like this.
    name = "suppress-maximize-events",
    match = "class=.*"
    --match:class = .*,
    --suppress_event = maximize,
  },
  {
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
  },
  {
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
      class      = "^$",
      title      = "^$",
      xwayland   = true,
      float      = true,
      fullscreen = false,
      pin        = false,
    },

    no_focus = true,
  },
  {
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
  },
  {
    name = "flameshot",
    move = "0 0",
    no_anim = true,
    no_initial_focus = true,
    match = {
      class = "flameshot",
      title = "flameshot",
      pin = true,
      fullscreen = "2,2",
      float = true,
    }
  },
  {
    name = "jetbrains-studio",
    border_size = 0,
    no_anim = true,
    no_initial_focus = true,
    match = {
      class = "jetbrains-studio",
      title = "^win(.*)",
      float = true,
    }
  }
}


for _, window_rule in ipairs(window_rules) do
  hl.window_rule(window_rule)
end
