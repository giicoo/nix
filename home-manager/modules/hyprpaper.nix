{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        "~/nix/wallpapers/japanes sky.png"
      ];
      wallpaper = [
        ",~/nix/wallpapers/japanes sky.png"
      ];
    };
  };
}
