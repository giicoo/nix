{ self, inputs, ... }: {
  flake.nixosModules.develop = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
     go
    ];
  };
}
