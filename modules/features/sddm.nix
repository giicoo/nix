{ self, inputs, ... }: {
  flake.nixosModules.sddm = { pkgs, lib, ... }:
    let
      echo-sddm = pkgs.stdenv.mkDerivation {
        pname = "echo-sddm";
        version = "1.0.0";

        src = pkgs.fetchFromGitHub {
          owner = "xCaptaiN09";
          repo = "echo-sddm";
          rev = "master";
          sha256 = "sha256-7Us7dzaGc/x1Vf8XFfHEMjB+xzhmMd4U5rtJJLI8e18=";
        };

        installPhase = ''
          mkdir -p $out/share/sddm/themes/echo
          cp -r Main.qml metadata.desktop theme.conf assets $out/share/sddm/themes/echo/
        '';
      };
    in {

      environment.systemPackages = with pkgs; [
        echo-sddm
        qt6.qt5compat
        jetbrains-mono
      ];

      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "echo";
        extraPackages = [ echo-sddm pkgs.qt6.qt5compat ];
      };
    };
}
