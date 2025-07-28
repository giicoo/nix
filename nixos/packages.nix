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

    kitty
    vscode
    home-manager
    gedit
    git
    openssh
    waybar
    rofi
    wofi
    
    wezterm
    ghostty
    zsh
    zsh-powerlevel10k
    obsidian
    openvpn

    grim
    slurp
    wl-clipboard


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
    python
    postgresql
    mosquitto
    transmission_4-gtk
    bottles
    gcc
    jetbrains.rider

    poetry
    ffmpeg
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