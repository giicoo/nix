{ self, inputs, ... }: {
  flake.nixosModules.beautiful = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.lavat
      pkgs.globe-cli
      pkgs.cloc
    ];
  };
}
