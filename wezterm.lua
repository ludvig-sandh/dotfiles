local wezterm = require("wezterm")

return {
  color_scheme = "rose-pine-moon",
  max_fps = 144,
  
  font = wezterm.font("Hack Nerd Font"),
  font_size = 15.0,
  hide_tab_bar_if_only_one_tab = true,
  enable_wayland = true,
  window_decorations = "RESIZE",
  --inactive_pane_hsb = {
  --  saturation = 0.0,
  --  brightness = 0.5,
  --},
  
  initial_cols = 180,
  initial_rows = 64,
  
  window_background_opacity = 0.85,
  text_background_opacity = 1.0,

  -- Optional blur (works on macOS and some Linux compositors)
  macos_window_background_blur = 50,

  harfbuzz_features = { "calt=0", "liga=0", "clig=0" },

}
