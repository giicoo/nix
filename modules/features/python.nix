{ self, inputs, ... }: {
  flake.nixosModules.python = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.python3
    ];
  };
}
