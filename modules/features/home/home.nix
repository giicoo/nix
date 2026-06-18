{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = { inherit inputs self; };

      users.tokito = {
        home.stateVersion = "26.05";

        imports = [
          self.homeModules.git
          self.homeModules.gtk
          self.homeModules.telegram
        ];
      };
    };
  };
}
