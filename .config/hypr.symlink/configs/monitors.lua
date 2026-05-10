------------------
---- MONITORS ----
------------------
--- @type HL.MonitorSpec[]
local monitors = {
  {
    output = "",
    --name = "eDP-1",
    mode = "preferred",
    position = "auto",
    bitdepth = 10,
    cm = "auto",
    scale = "1.25",
    vrr = 1
  },
  {
    output = "",
    --desc = "LG Electronics 27GL650F 0x00036C03",
    mode = "1920x1080@144",
    position = "auto",
    bitdepth = 10,
    cm = "auto",
    scale = "1.25",
    vrr = 1
  }
}

for _, monitor in ipairs(monitors) do
  hl.monitor(monitor)
end
