-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
local env_vars = {
  { name = "XCURSOR_SIZE",                value = "48", },
  { name = "HYPRCURSOR_SIZE",             value = "48", },
  { name = "QT_CURSOR_SIZE",              value = "48", },
  { name = "LC_ALL",                      value = "zh_CN.UTF-8", },
  { name = "QT_IM_MODULE",                value = "fcitx", },
  { name = "HYPRCURSOR_THEME",            value = "Hackneyed-Dark", },
  { name = "QT_CURSOR_THEME",             value = "Hackneyed-Dark", },
  { name = "XCURSOR_THEME",               value = "Hackneyed-Dark", },
  { name = "_JAVA_AWT_WM_NONREPARENTING", value = "1", },
}

for _, env in ipairs(env_vars) do
  hl.env(env.name, env.value)
end
