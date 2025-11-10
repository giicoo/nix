{
  inputs,
  pkgs,
  ...
}: let
    sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
      theme = "default";
    };

    python = (pkgs.python3.withPackages (python-pkgs: []));
in {
   nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # jetbrains
    jetbrains.pycharm-community
    jetbrains.rider
    jetbrains.clion

    # apps
    telegram-desktop
    gedit
    kitty
    obsidian

    # terminal
    zsh
    zsh-powerlevel10k
    ghostty
    wezterm

    # utils
    git
    openssh
    p7zip
    system76-power
    openvpn
    fastfetch
    zip
    unzip
    imv
    openssl
    poetry
    ffmpeg

    # editor
    neovim
    zed-editor
    vscode
    vim

    # hyprland
    hyprpaper
    waybar
    rofi
    wofi
    xdg-desktop-portal
    xdg-desktop-portal-gtk

    # nemo
    nemo-with-extensions
    file-roller

    # prog
    yarn
    nodejs
    docker-compose
    dotnet-sdk
    dotnet-runtime
    python
    postgresql
    mosquitto
    cmake
    clang
    gcc
    gcc
    gnumake
    omnisharp-roslyn
    uv
    qtcreator

    # nix
    home-manager

    # screen shots
    grim
    slurp
    wl-clipboard

    # keyboard
    qmk
    qmk-udev-rules
    qmk_hid
    via
    vial

    # themes
    materia-theme
    papirus-icon-theme
    bibata-cursors
    transmission_4-gtk
    sddm-theme
    qt5.full

    # libre
    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA

    # WINDOWS!!!!
    bottles
    wineWowPackages.stable
    wine
    (wine.override { wineBuild = "wine64"; })
    wine64
    wineWowPackages.staging
    winetricks
    lutris
    protonup-qt
    protontricks
    steam
    vulkan-tools
    mesa-demos


  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
  ];
}
