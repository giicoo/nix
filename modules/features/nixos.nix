{ self, inputs, ... }: {
  flake.nixosModules.nixos = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
         ncdu
         nix-tree
    ];

  };
}
