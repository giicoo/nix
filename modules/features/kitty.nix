{ self, inputs, ... }: {
  flake.nixosModules.kitty = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myKitty
    ];
  };
  perSystem = { pkgs, lib, self', ... }: {
    packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
      inherit pkgs;
      settings = {
        font_family = "JetBrainsMono Nerd Font";
        cursor_blink_interval = 0;

        foreground               = "#cdcdcd";
        background               = "#141415";
        selection_foreground     = "#cdcdcd";
        selection_background     = "#252530";
        cursor                   = "none";
        url_color                = "#bb9dbd";
        active_border_color      = "#878787";
        inactive_border_color    = "#252530";

        color0  = "#252530";
        color8  = "#606079";
        color1  = "#d8647e";
        color9  = "#e08398";
        color2  = "#7fa563";
        color10 = "#99b782";
        color3  = "#f3be7c";
        color11 = "#f5cb96";
        color4  = "#6e94b2";
        color12 = "#8ba9c1";
        color5  = "#bb9dbd";
        color13 = "#c9b1ca";
        color6  = "#aeaed1";
        color14 = "#bebeda";
        color7  = "#cdcdcd";
        color15 = "#d7d7d7";

        active_tab_foreground   = "#cdcdcd";
        active_tab_background   = "#252530";
        inactive_tab_foreground = "#606079";
        inactive_tab_background = "#141415";
      };
    };
  };
}
