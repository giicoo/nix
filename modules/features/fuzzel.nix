{ self, inputs, ... }: {
  flake.nixosModules.fuzzel = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myFuzzel
    ];
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myFuzzel = inputs.wrapper-modules.wrappers.fuzzel.wrap {
      inherit pkgs;
      settings = {
        colors = {
          background="161616ff";
          text="ffffffff";
          match="ee5396ff";
          selection-match="ee5396ff";
          selection="262626ff";
          selection-text="33b1ffff";
          border="525252ff";
        };
      };
    };
  };
}
