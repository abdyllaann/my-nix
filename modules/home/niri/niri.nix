{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    niri
  ];
  #
  # xdg.configFile."niri/config.ron".text = ''
  #   Config(
  #     cursor_theme: Some("Adwaita"),
  #     cursor_size: Some(24),
  #     default_border_width: 4,
  #     default_font_family: Some("Maple Mono"),
  #     default_font_size: Some(14),
  #     modifier: Some("Mod4"),
  #     terminal: Some("foot"),
  #     launcher: Some("rofi -show drun"),
  #     exec: Some([
  #       "waybar",
  #       "mako",
  #       "swww-daemon",
  #       "nextcloud",
  #       "gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg",
  #     ]),
  #     outputs: Some({
  #       "eDP-1": OutputConfig(
  #         resolution: Some((1920, 1080)),
  #         position: Some((0, 0)),
  #       ),
  #       "HDMI-A-1": OutputConfig(
  #         resolution: Some((1920, 1080)),
  #         position: Some((1920, 0)),
  #       ),
  #     }),
  #     keybindings: Some({
  #       "Mod4+Return": "launch_terminal",
  #       "Mod4+d": "launch_launcher",
  #       "Mod4+q": "close",
  #       "Mod4+f": "toggle_fullscreen",
  #       "Mod4+Shift+space": "toggle_floating",
  #       "Mod4+1": "switch_workspace 1",
  #       "Mod4+2": "switch_workspace 2",
  #       "Mod4+3": "switch_workspace 3",
  #       "Mod4+4": "switch_workspace 4",
  #       "Mod4+5": "switch_workspace 5",
  #       "Mod4+6": "switch_workspace 6",
  #       "Mod4+7": "switch_workspace 7",
  #       "Mod4+8": "switch_workspace 8",
  #       "Mod4+9": "switch_workspace 9",
  #       "Mod4+0": "switch_workspace 10",
  #       "Mod4+Shift+1": "move_to_workspace 1",
  #       "Mod4+Shift+2": "move_to_workspace 2",
  #       "Mod4+Shift+3": "move_to_workspace 3",
  #       "Mod4+Shift+4": "move_to_workspace 4",
  #       "Mod4+Shift+5": "move_to_workspace 5",
  #       "Mod4+Shift+6": "move_to_workspace 6",
  #       "Mod4+Shift+7": "move_to_workspace 7",
  #       "Mod4+Shift+8": "move_to_workspace 8",
  #       "Mod4+Shift+9": "move_to_workspace 9",
  #       "Mod4+Shift+0": "move_to_workspace 10",
  #
  #       "Mod4+h": "focus_left",
  #       "Mod4+j": "focus_down",
  #       "Mod4+k": "focus_up",
  #       "Mod4+l": "focus_right",
  #       "Mod4+Shift+h": "move_left",
  #       "Mod4+Shift+j": "move_down",
  #       "Mod4+Shift+k": "move_up",
  #       "Mod4+Shift+l": "move_right",
  #
  #       # Custom apps
  #       "Mod4+e": "exec nautilus",
  #       "Mod4+z": "exec zapzap",
  #       "Mod4+y": "exec yazi-nvim",
  #       "Mod4+Shift+q": "exec power-menu",
  #       "Mod4+Shift+x": "exec random-wallpaper",
  #
  #       # Volume & brightness (locked keys)
  #       "--locked XF86AudioMute": "exec pactl set-sink-mute @DEFAULT_SINK@ toggle",
  #       "--locked XF86AudioLowerVolume": "exec pactl set-sink-volume @DEFAULT_SINK@ -5%",
  #       "--locked XF86AudioRaiseVolume": "exec pactl set-sink-volume @DEFAULT_SINK@ +5%",
  #       "--locked XF86AudioMicMute": "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle",
  #       "--locked XF86MonBrightnessDown": "exec brightnessctl set 5%-",
  #       "--locked XF86MonBrightnessUp": "exec brightnessctl set 5%+",
  #     }),
  #   )
  # '';
}
