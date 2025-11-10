{ 
  inputs, 
  pkgs, 
  ... 
}: let 
    swww = inputs.swww.packages.${pkgs.system}.swww;

    sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
      theme = "default"; # select the config of your choice
    };

    python = (pkgs.python3.withPackages (python-pkgs: [
    ]));
  
in {
   nixpkgs.config = {
    allowUnfree = true;
  };
  
  environment.systemPackages = with pkgs; [
    jetbrains.pycharm-community
    jetbrains.clion
    neovim
    imv
    yarn
    system76-power
    telegram-desktop
    vim
    zed-editor
    p7zip
    kitty
    vscode
    home-manager
    gedit
    git
    openssh
    waybar
    rofi
    wofi
    uv 
    wezterm
    ghostty
    zsh
    zsh-powerlevel10k
    obsidian
    openvpn

    grim
    slurp
    wl-clipboard

    qmk
    qmk-udev-rules # the only relevant
    qmk_hid
    via
    vial 
    nodejs

    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA

    fastfetch
    nemo-with-extensions
    file-roller
    unzip
    zip

    materia-theme
    papirus-icon-theme
    bibata-cursors

    swww

    sddm-theme
    openssl
    docker-compose  
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    dotnet-sdk
    dotnet-runtime
    omnisharp-roslyn
    python
    postgresql
    mosquitto
    transmission_4-gtk
    bottles
    gcc
    jetbrains.rider

    poetry
    ffmpeg

    qt5.full
    qtcreator
    cmake
    clang
    gcc
    gnumake
    bottles
    
    wineWowPackages.stable

    # support 32-bit only
    wine

    # support 64-bit only
    (wine.override { wineBuild = "wine64"; })

    # support 64-bit only
    wine64

    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks (all versions)
    winetricks

    
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