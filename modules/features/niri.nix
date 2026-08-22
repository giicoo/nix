{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };

    environment.systemPackages = with pkgs; [
      awww
      fuzzel
      nemo
    ];
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        prefer-no-csd = _: { };

        hotkey-overlay = {
          skip-at-startup = _: { };
        };

        spawn-at-startup = [
          "awww-daemon"
        ];

        outputs."HDMI-A-1" = {
          transform = "270";
          position = _: {
              props = {
                x = 0;
                y = -1280;
              };
            };
        };

        animations = {
            off = _: { };
          };

        environment = {
          QT_STYLE_OVERRIDE = "kvantum";
          QT_QPA_PLATFORMTHEME = "kvantum";
          GDK_CORE_DEVICE_EVENTS = "1";
        };

        clipboard = {
          disable-primary = true;
        };

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input = {
          keyboard = {
            xkb = {
              layout = "us,ru";
              options = "grp:alt_shift_toggle";
            };
          };
        };

        layout = {
          gaps = 16;
          border = {
            off = _: { };
            width = 3;
            active-color = "#ffffff";
          };

          # center-focused-column = "always";

          focus-ring = {
            width = 5;
            active-color = "#99b782";
          };

          preset-column-widths = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
          ];

        };

        debug = {
          render-drm-device = "/dev/dri/renderD129";
        };



        binds = {
          "Mod+Shift+Slash".show-hotkey-overlay = _: { };

          "Mod+Q".spawn = "kitty";
          "Mod+E".spawn = "nemo";
          "Mod+W".spawn = "fuzzel";

          "Mod+C".close-window = _: { };
          "Mod+M".quit = _: { };

          "Mod+P".spawn-sh = "";
          "Mod+O".spawn-sh = "";

          "Mod+T".toggle-window-floating = _: { };

          "Mod+Left".focus-column-left = _: { };
          "Mod+Right".focus-column-right = _: { };
          "Mod+Up".focus-window-up = _: { };
          "Mod+Down".focus-window-down = _: { };

          "Mod+H".focus-column-left = _: { };
          "Mod+J".focus-window-down = _: { };
          "Mod+K".focus-window-up = _: { };
          "Mod+L".focus-column-right = _: { };

          "Mod+Shift+H".move-column-left = _: { };
          "Mod+Shift+J".consume-or-expel-window-left = _: { };
          "Mod+Shift+K".consume-or-expel-window-right = _: { };
          "Mod+Shift+L".move-column-right = _: { };

          "Mod+R".switch-preset-column-width = _: { };

          "Mod+F".maximize-column = _: { };
          "Mod+Shift+F".fullscreen-window = _: { };

          "Mod+G".center-column = _: { };

          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;
          "Mod+0".focus-workspace = 10;

          "Mod+Shift+1".move-window-to-workspace = 1;
          "Mod+Shift+2".move-window-to-workspace = 2;
          "Mod+Shift+3".move-window-to-workspace = 3;
          "Mod+Shift+4".move-window-to-workspace = 4;
          "Mod+Shift+5".move-window-to-workspace = 5;
          "Mod+Shift+6".move-window-to-workspace = 6;
          "Mod+Shift+7".move-window-to-workspace = 7;
          "Mod+Shift+8".move-window-to-workspace = 8;
          "Mod+Shift+9".move-window-to-workspace = 9;
          "Mod+Shift+0".move-window-to-workspace = 10;

          # Hardware & Audio Keys
          "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86MonBrightnessDown".spawn-sh = "brightnessctl set 5%-";
          "XF86MonBrightnessUp".spawn-sh = "brightnessctl set 5%+";

          "Mod+Shift+S".screenshot = _: { };
        };
      };
    };
  };
}
