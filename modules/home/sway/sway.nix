{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
    autotiling
  ];
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    systemd.enable = true;

    config = {
      modifier = "Mod4";
      terminal = "kitty";
      menu = "rofi -show drun";
      bars = [{ command = "swaybar_command waybar"; }];
      gaps = {
        inner = 5;
        outer = 7;
        # smartGaps = true;
      };
      window = {
        border = 4;
        titlebar = false;
      };
      floating = {
        modifier = "Mod4";
      };
      fonts = {
        names = [ "Maple Mono" ];
        size = 14.0;
      };
      colors = {
        focused = {
          border = "#CD5656";
          background = "#282828";
          text = "#FBF1C7";
          indicator = "#D65D0E";
          childBorder = "#CD5656";
        };
        unfocused = {
          border = "#1D2021";
          background = "#1D2021";
          text = "#928374";
          indicator = "#1D2021";
          childBorder = "#1D2021";
        };
        urgent = {
          border = "#CD5656";
          background = "#CC241D";
          text = "#FBF1C7";
          indicator = "#CC241D";
          childBorder = "#CC241D";
        };
      };
      keybindings = let
        mod = "Mod4";
      in {
        "${mod}+Return" = "exec kitty";
        "${mod}+d" = "exec rofi -show drun";
        "${mod}+o" = "exec rofimoji";
        "${mod}+b" = "exec zen";
        "${mod}+e" = "exec nautilus";
        "${mod}+y" = "exec kitty -e yazi";
        "${mod}+z" = "exec zapzap";
        "${mod}+Shift+q" = "exec power-menu";
        "${mod}+q" = "kill";
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        "${mod}+Shift+x" = "exec random-wallpaper";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";
        "${mod}+Shift+v" = "splith";
        "${mod}+v" = "splitv";
        "${mod}+w" = "layout tabbed";
        "${mod}+s" = "layout toggle split";
        "${mod}+f" = "fullscreen";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+a" = "focus parent";
        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 1s0";
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
        "${mod}+r" = "mode resize";
        "${mod}+Shift+s" = "exec screenshot";
        "${mod}+Shift+p" = "exec toggle_display";
        "--locked XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "--locked XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "--locked XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "--locked XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "--locked XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "--locked XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
      };
      modes = {
        resize = {
          h = "resize shrink width 10px";
          j = "resize grow height 10px";
          k = "resize shrink height 10px";
          l = "resize grow width 10px";
          Left = "resize shrink width 10px";
          Down = "resize grow height 10px";
          Up = "resize shrink height 10px";
          Right = "resize grow width 10px";
          Return = "mode default";
          Escape = "mode default";
        };
      };
      startup = [
        { command = "mako"; always = true; }
        # { command = "autotiling"; always = true; }
        { command = "swww-daemon"; always = true; }
        { command = "nextcloud"; always = true; }
        { command = "gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg"; always = true; }
      ];
      output = {
        "eDP-1" = {
          resolution = "1920x1080";
          position = "0,0";
        };
        "HDMI-A-1" = {
          resolution = "1920x1080";
          position = "1920,0";
        };
      };
    };
  };

  # services.mako.enable = true;
 }

