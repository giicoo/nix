{ self, inputs, ... }: {
  flake.nixosModules.obs = { pkgs, lib, ... }: {
    programs.obs-studio = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      kdePackages.kdenlive  # или shotcut
    ];
  };
}
