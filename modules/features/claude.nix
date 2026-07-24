{ self, inputs, ... }: {
  flake.nixosModules.claude = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.claude-code
    ];
  };
}
