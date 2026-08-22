{ self, inputs, ... }: {
  flake.nixosModules.js = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.nodejs
      pkgs.yarn
      pkgs.pnpm
    ];
  };
}
