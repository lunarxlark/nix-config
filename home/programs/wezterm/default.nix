{ pkgs, ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      wezterm.on('update-status', function(window, pane)
        local overrides = window:get_config_overrides() or {}
        if window:is_focused() then
          overrides.color_scheme = 'nordfox'
        else
          overrides.color_scheme = 'nightfox'
        end
        window:set_config_overrides(overrides)
      end)

      return {
        color_scheme = "nordfox",
        font_size = 10,
        disable_default_key_bindings = true,
        window_decorations = 'RESIZE',
        leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
        keys = {
          -- font size
        	  { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
          { key = "=", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
          -- tab
          { key = "t", mods = "SUPER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
          { key = "phys:Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
          { key = "phys:Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
          -- pane split
          { key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
          { key = "|", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
          -- pane move
          { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
          { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
          { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
          { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
          -- pane adjust
          { key = "H", mods = "SHIFT|SUPER", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
          { key = "J", mods = "SHIFT|SUPER", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
          { key = "K", mods = "SHIFT|SUPER", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
          { key = "L", mods = "SHIFT|SUPER", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
          -- pane zoom
          { key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
          -- copy
          { key = "c", mods = "SUPER", action = wezterm.action.CopyTo("Clipboard") },
          { key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") },
          -- window
          { key = "f", mods = "SUPER|CTRL", action = wezterm.action.ToggleFullScreen },
        }
      }
    '';
  };
}
