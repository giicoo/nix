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
      self.nixosModules.yazi
      self.nixosModules.amnezia
      self.nixosModules.home-manager
    ];

    time.timeZone = "Europe/Moscow";

    nixpkgs.config.allowUnfree = true;

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
    ];

    fonts.packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
      twemoji-color-font
      font-awesome
      powerline-fonts
      powerline-symbols
    ];
  };

}
