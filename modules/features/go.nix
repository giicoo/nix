{ self, inputs, ... }: {
  flake.nixosModules.go = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.go
      pkgs.gopls
      pkgs.gcc
      pkgs.ghz
      pkgs.buf
      pkgs.grpcurl
    ];
  };
}
