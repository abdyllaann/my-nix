{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [ swayosd ];

  wayland.windowManager.sway = {

    config = {
      startup = [
        { command = "swayosd-server"; }
      ];

      keybindings = lib.mkOptionDefault {
        ",XF86AudioMute" = "exec swayosd-client --output-volume mute-toggle";

        ",XF86MonBrightnessUp" = "exec swayosd-client --brightness raise 5%+";
        ",XF86MonBrightnessDown" = "exec swayosd-client --brightness lower 5%-";
        "Mod4+XF86MonBrightnessUp" = "exec brightnessctl set 100%";
        "Mod4+XF86MonBrightnessDown" = "exec brightnessctl set 0%";

        ",XF86AudioRaiseVolume" = "exec swayosd-client --output-volume +2 --max-volume=100";
        ",XF86AudioLowerVolume" = "exec swayosd-client --output-volume -2";
        "Mod4+F11" = "exec swayosd-client --output-volume +2 --max-volume=100";
        "Mod4+F12" = "exec swayosd-client --output-volume -2";

        "CAPS" = "exec swayosd-client --caps-lock";
        "Scroll_Lock" = "exec swayosd-client --scroll-lock";
        "Num_Lock" = "exec swayosd-client --num-lock";
      };
    };
  };

  xdg.configFile."swayosd/style.css".text = ''
    window {
        padding: 0px 10px;
        border-radius: 25px;
        border: 10px;
        background: alpha(#282828, 0.99);
    }

    #container {
        margin: 15px;
    }

    image, label {
        color: #FBF1C7;
    }

    progressbar:disabled,
    image:disabled {
        opacity: 0.95;
    }

    progressbar {
        min-height: 6px;
        border-radius: 999px;
        background: transparent;
        border: none;
    }
    trough {
        min-height: inherit;
        border-radius: inherit;
        border: none;
        background: alpha(#DDDDDD, 0.2);
    }
    progress {
        min-height: inherit;
        border-radius: inherit;
        border: none;
        background: #FBF1C7;
    }
  '';
}
