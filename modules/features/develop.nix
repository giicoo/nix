{ self, inputs, ... }: {
  flake.nixosModules.develop = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
     go
     sqlc
     unzip
     distrobox
     podman
     transmission_4-gtk
     postman
    ];
  };
}
