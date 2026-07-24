{ self, inputs, ... }: {
  flake.nixosModules.ai = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      open-webui
    ];

    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
    };
  };
}
