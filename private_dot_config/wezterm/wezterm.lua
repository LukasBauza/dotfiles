local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13.0

config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false

config.leader = {
  key = "Space",
  mods = "SHIFT",
  timeout_milliseconds = 1000,
}

config.keys = {
  {
    key = "o",
    mods = "LEADER",
    action = wezterm.action.ActivateKeyTable({
      name = "open",
      one_shot = true,
      timeout_milliseconds = 1000,
    }),
  },
  {
    key = "w",
    mods = "LEADER",
    action = wezterm.action.ActivateKeyTable({
      name = "window",
      one_shot = true,
      timeout_milliseconds = 1000,
    }),
  },
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
}

config.key_tables = {
  open = {
    {
      key = "t",
      action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
    {
      key = "g",
      action = wezterm.action.SplitPane({
        direction = "Down",
        command = {
          args = { "nvim" },
        },
      }),
    },
  },
  window = {
    {
      key = "s",
      action = wezterm.action.SplitPane({
        direction = "Down",
      })
    },
    {
      key = "v",
      action = wezterm.action.SplitPane({
        direction = "Right",
      })
    },
    {
      key = "q",
      action = wezterm.action.CloseCurrentPane({
        confirm = false,
      })
    },
  },
}

return config
