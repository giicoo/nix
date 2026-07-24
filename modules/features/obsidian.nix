{ self, inputs, ... }: {
  flake.nixosModules.obsidian = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      obsidian
    ];

  };
}
