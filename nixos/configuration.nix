{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./nvidia.nix
      ./modules/bundle.nix
    ];

  disabledModules = [];

  networking.hostName = "nixos"; 

  time.timeZone = "Europe/Moscow";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
  hardware.alsa.enable = false;   # включает ALSA
  hardware.pulseaudio.enable = false;  # если вдруг у тебя включен старый pulseaudio
  services.pipewire.enable = true;    # если не хочешь pipewire
}
