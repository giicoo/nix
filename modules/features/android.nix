{ self, inputs, ... }: {
  flake.nixosModules.android = { pkgs, lib, config, ... }: {
      environment.systemPackages = [
        pkgs.android-studio
      ];

  };
}
