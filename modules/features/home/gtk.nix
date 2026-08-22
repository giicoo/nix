{ self, inputs, ... }: {
  flake.homeModules.gtk = { pkgs, lib, ... }:
  let
    vague-gtk-theme = pkgs.stdenvNoCC.mkDerivation {
      pname = "vague-gtk-theme";
      version = "unstable";
      src = pkgs.fetchFromGitHub {
        owner = "vague-theme";
        repo = "vague-gtk";
        rev = "main";
        hash = "sha256-eEP4r/0Kb7RyB45pSe47bHwAx40gG/3XWGlr/UB7g4g=";
      };
      installPhase = ''
        runHook preInstall
        mkdir -p $out/share/themes
        cp -a Vague $out/share/themes/
        runHook postInstall
      '';
      meta = {
        description = "Vague GTK theme";
        homepage = "https://github.com/vague-theme/vague-gtk";
        license = lib.licenses.mit;
      };
    };
  in {
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 16;
    };
    home.activation.vagueGtk4 = lib.hm.dag.entryAfter ["writeBoundary"] ''
          mkdir -p ~/.config/gtk-4.0
          ln -sf ${vague-gtk-theme}/share/themes/Vague/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
          ln -sf ${vague-gtk-theme}/share/themes/Vague/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css
        '';
    home.packages = [
      vague-gtk-theme
      pkgs.papirus-icon-theme
      pkgs.libsForQt5.qt5ct
      pkgs.qt6Packages.qt6ct          # было pkgs.qt6ct
      pkgs.libsForQt5.qtstyleplugin-kvantum
      pkgs.kdePackages.qtstyleplugin-kvantum
    ];
    gtk = {
      enable = true;
      theme = {
        name = "Vague";
        package = vague-gtk-theme;
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
    };
    qt = {
      enable = true;
      platformTheme.name = "kvantum";
      style.name = "kvantum-dark";
    };
    xdg.configFile."Kvantum/Vague/Vague.kvconfig".text = ''
      [%General]
      author=vague-theme
      comment=Vague Qt theme

      [GeneralColors]
      window.color=#141415
      base.color=#1c1c24
      alt.base.color=#252530
      button.color=#252530
      light.color=#333738
      mid.light.color=#1c1c24
      dark.color=#0e0e0f
      mid.color=#141415
      shadow.color=#0a0a0b
      highlight.color=#6e94b2
      inactive.highlight.color=#405065
      text.color=#cdcdcd
      window.text.color=#cdcdcd
      button.text.color=#cdcdcd
      disabled.text.color=#606079
      tooltip.base.color=#252530
      tooltip.text.color=#cdcdcd
      link.color=#7e98e8
      link.visited.color=#bb9dbd
    '';
    xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Vague
    '';
    xdg.configFile."Kvantum/Vague/Vague.svg".source = "${pkgs.libsForQt5.qtstyleplugin-kvantum}/share/Kvantum/KvDark/KvDark.svg";
  };
}
