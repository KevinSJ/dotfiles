-----------------------
----- PERMISSIONS -----
-----------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons
hl.config({
  ecosystem = {
    enforce_permissions = true,
  },
})

--- @type HL.PermissionSpec[]
local permissions = {
  {
    binary = "/usr/(bin|local/bin)/hyprlock",
    type = "screencopy",
    mode = "allow"
  },
  {
    binary = "/usr/(bin|local/bin)/grim",
    type = "screencopy",
    mode = "allow"
  },
  {
    binary = "/usr/(bin|local/bin)/flameshot",
    type = "screencopy",
    mode = "allow"
  },
  {
    binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",
    type = "screencopy",
    mode = "allow"
  },
  {
    binary = "/usr/(bin|local/bin)/hyprpm",
    type = "plugin",
    mode = "allow"
  }
}


for _, permission in ipairs(permissions) do
  hl.permission(permission)
end
