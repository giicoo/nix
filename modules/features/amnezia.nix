{ self, inputs, ... }: {
  flake.nixosModules.amnezia = { config, pkgs, ... }:
  let
    kernel = config.boot.kernelPackages;
  in {
    boot.extraModulePackages = with kernel; [ amneziawg ];

    programs.amnezia-vpn.enable=true;
    environment.systemPackages = with pkgs; [
      amnezia-vpn
      amneziawg-tools
      amneziawg-go
    ];
  };
}
