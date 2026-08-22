{ self, inputs, ... }: {
  flake.nixosModules.devops = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      opentofu
      ansible
    ];

  };
}
