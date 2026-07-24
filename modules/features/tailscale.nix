{ self, pkgs, ... }: {
  flake.nixosModules.tailscale = { config, pkgs, ... }:
  {
    services.tailscale.enable = true;

    environment.systemPackages = [ pkgs.tailscale ];

    networking.firewall.checkReversePath = "loose";
  };
}
