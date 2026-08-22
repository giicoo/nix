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
          sha256 = "sha256-J8JCTkbQhhxJam3GmmHLAt8sRqGqLUsBdkehUjvJZbs=";
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
