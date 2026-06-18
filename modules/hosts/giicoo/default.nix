{ self, inputs, ... }: {
  flake.nixosConfigurations.tokito = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.configuration
    ];
  };
}
