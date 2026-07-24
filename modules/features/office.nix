{ self, inputs, ... }: {
  flake.nixosModules.office = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.onlyoffice-desktopeditors
    ];
  };
}
