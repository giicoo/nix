{ self, inputs, ... }: {
  flake.nixosModules.waybar = { pkgs, lib, ... }: {
    programs.waybar = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myWaybar;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myWaybar = inputs.wrapper-modules.wrappers.waybar.wrap {
      inherit pkgs;
      settings = {
          layer = "top";
          position = "top";
          margin = "0 0 0 0";

          modules-left = [ "niri/workspaces"];
          modules-center = ["clock"];
          modules-right = ["pulseaudio" "backlight" "tray" "swaync"];


          "clock" = {
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = "{:%H:%M}";
          };


          "pulseaudio" = {
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


      "style.css".path = pkgs.writeText "waybar.css" ''

        * {
            background: transparent;
            border: none;
            border-radius: 0;
            font-family: JetBrains Mono;
            font-weight: bold;
            color: #ffffff;
            min-height: 30px;
            margin: 0 0 0 0;
            padding: 0 0 0 0;
        }

        #workspaces button {
            font-size: 15px;
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
  };
}
