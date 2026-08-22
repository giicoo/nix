{ self, inputs, ... }: {
  flake.nixosModules.docker = { pkgs, lib, ... }: {
    virtualisation.docker = {
        enable = true;

        rootless = {
            enable = true;
            setSocketVariable = true;
        };
    };

    virtualisation.podman = {
      enable = true;
    };
  };
}
