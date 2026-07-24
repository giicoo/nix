{ self, inputs, ... }: {

  flake.nixosModules.configuration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.hardware
      self.nixosModules.nvidia
      self.nixosModules.zsh
      self.nixosModules.waybar
      self.nixosModules.firefox
      self.nixosModules.niri
      self.nixosModules.kitty
      self.nixosModules.sddm
      self.nixosModules.fuzzel
      self.nixosModules.develop
      self.nixosModules.claude
      self.nixosModules.beautiful
      self.nixosModules.ai
      self.nixosModules.docker
      self.nixosModules.tailscale
      self.nixosModules.office
      self.nixosModules.go
      self.nixosModules.python
      self.nixosModules.js
      self.nixosModules.nvim
      self.nixosModules.ctf
      self.nixosModules.yazi
      self.nixosModules.nixos
      self.nixosModules.android
      self.nixosModules.obsidian
      self.nixosModules.amnezia
      self.nixosModules.home-manager
    ];

    time.timeZone = "Europe/Moscow";

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.android_sdk.accept_license = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    services.blueman.enable = true;

    networking.networkmanager.enable = true;

    users = {
      defaultUserShell = pkgs.zsh;

      users.tokito = {
        isNormalUser = true;
        description = "tokito";
        extraGroups = [ "networkmanager" "wheel" "input" "docker" "seat" "video" ];
        packages = with pkgs; [];
      };
    };

    environment.systemPackages = with pkgs; [
      vim
      zed-editor
      anki
      go-task
      openssl
      krita
    ];

    fonts.packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
      twemoji-color-font
      font-awesome
      powerline-fonts
      corefonts
      powerline-symbols
    ];
  };

}
