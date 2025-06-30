{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/bundle.nix
    ];

  disabledModules = [];

  networking.hostName = "nixos"; 

  time.timeZone = "Europe/Moscow";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";

}
