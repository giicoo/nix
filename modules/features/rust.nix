{ self, inputs, ... }: {
  flake.nixosModules.rust = { pkgs, lib, ... }: {
    nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
    environment.systemPackages = [
      (pkgs.rust-bin.stable.latest.default.override {
        extensions = [ "rust-src" "rust-analyzer" ];
      })
    ];
  };
}
