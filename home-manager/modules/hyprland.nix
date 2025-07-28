{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {


      monitor=",preferred,auto,1";

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,17"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
      ];

      exec-once = [
        "swww-daemon"
        "swww img ./wallpapers/japanes\ sky.png"

        "waybar"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };
                                                         
      general = { 
          gaps_in = 5;
          gaps_out = 10;

          border_size = 2;
          
          "col.active_border" = "rgba(595959aa)";
          "col.inactive_border" = "rgb(181818)";
        
          # change size by mouse
          resize_on_border = true;
        
          hover_icon_on_border = true;
          allow_tearing = false;

          layout = "dwindle";
      };

      decoration = {
          rounding = 10;

          active_opacity = 0.7;
          inactive_opacity = 0.7;
        
          blur = {
              enabled = true;
              size = 5;
              passes = 3;
              new_optimizations = true;
              ignore_opacity = true;
              noise = 0;
              brightness = 0.8;
          };
      };

      animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
          
      };


      input = {
          kb_layout = "us,ru";
         
          kb_options="grp:alt_shift_toggle";
          follow_mouse = 1;
          mouse_refocus=1;

          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

          touchpad = {
              natural_scroll = false;
          };
      };

      gestures = {
          workspace_swipe = true;
      };

      cursor = {
        no_warps = true;
        no_hardware_cursors = true;
      };


      dwindle = {
          pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true; # You probably want this
      };

      master = {
          new_status = "master";
      };

      misc = { 
          force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
      };


      device = {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
      };
     
      "$mainMod" = "SUPER";    

      "$terminal" = "kitty";
      "$fileManager" = "nemo";
      "$menu" = "pkill rofi || rofi -show drun -no-config -theme ~/.config/rofi/config.rasi";
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, W, exec, $menu"

        "ALT, P, exec, hyprpicker --autocopy"
        "$mainMod SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"

        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"

        "$mainMod, P, exec, poweroff"
        "$mainMod, O, exec, reboot"

        "$mainMod, F, togglefloating,"
        "$mainMod, B, pseudo," # dwindle
        "$mainMod, N, togglesplit," # dwindle

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod ALT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ "
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
