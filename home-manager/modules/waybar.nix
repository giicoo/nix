{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "0 0 0 0";

        modules-left = ["hyprland/workspaces" "hyprland/submap"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "backlight" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = false;
        };

    "clock" = {
        # timezone = "America/New_York";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format = "{:%H:%M}";
    };

    "pulseaudio" = {
        # scroll-step = 1; # %, can be a float
        reverse-scrolling = 1;
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {i%d %b  con}";
        format-bluetooth-muted = " {icon}";
        format-muted = "";
        format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
        };
        on-click = "pavucontrol";
        min-length = 13;
    };

    "backlight" = {
        device = "intel_backlight";
        format = "{percent}% {icon}";
        format-icons = [""];
        min-length = 7;
    };


    tray = {
        icon-size = 16;
        spacing = 0;
    };

      };
    };
  
    style = 
      ''
* {
    background: transparent;
    border: none;
    border-radius: 0;
    font-family: JetBrains Mono;
    font-weight: bold;
    min-height: 30px;
    margin: 0 0 0 0;
    padding: 0 0 0 0;
}

window#waybar {
    background-color: rgba(0, 0, 0, 0);
}

#workspaces {
}

#workspaces button {
    font-size: 15px;
    color: #ffffff;
    padding: 0 8px 0 8px;
    background: transparent;
    border-bottom: 2px solid transparent;
}

#workspaces button.active {
    border-bottom: 2px solid rgb(255, 255, 255);
}

#clock, #pulseaudio, #tray {
    font-size: 15px;
    color: #ffffff;
    background: transparent;
}


      '';
  };
}