{ ... }:
{
  programs.kitty = {
    enable = true;

    themeFile = "gruvbox-dark-hard";

    font = {
      name = "Maple Mono";
      size = 12;
    };

    extraConfig = ''
      font_features MapleMono-Regular +ss01 +ss02 +ss04
      font_features MapleMono-Bold +ss01 +ss02 +ss04
      font_features MapleMono-Italic +ss01 +ss02 +ss04
      font_features MapleMono-Light +ss01 +ss02 +ss04

      # Base colors
      foreground              #dadada
      background              #141b1e
      selection_foreground    #dadada
      selection_background    #2d3437

      # # Cursor colors
      # cursor                  #2d3437
      # cursor_text_color       #dadada

      # Normal colors
      color0                  #232a2d
      color1                  #e57474
      color2                  #8ccf7e
      color3                  #e5c76b
      color4                  #67b0e8
      color5                  #c47fd5
      color6                  #6cbfbf
      color7                  #b3b9b8

      # Bright colors
      color8                  #2d3437
      color9                  #ef7e7e
      color10                 #96d988
      color11                 #f4d67a
      color12                 #71baf2
      color13                 #ce89df
      color14                 #67cbe7
      color15                 #bdc3c2

      # Tab colors 
      active_tab_foreground   #e182e0
      active_tab_background   #1b2224
      inactive_tab_foreground #cd69cc
      inactive_tab_background #232a2c

    '';

    settings = {
      hide_window_decorations = true;
      confirm_os_window_close = 0;
      background_opacity = 0.85;
      background_blur = 10;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;
      window_padding_width = 5;

      ## Tabs
      tab_title_template = "{index}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";
      active_tab_foreground = "#FBF1C7";
      active_tab_background = "#141b1e";
      inactive_tab_foreground = "#FBF1C7";
      inactive_tab_background = "#3C3836";
    };

    keybindings = {
      ## Tabs
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";

      ## Unbind
      "ctrl+shift+left" = "no_op";
      "ctrl+shift+right" = "no_op";
    };
  };
}
