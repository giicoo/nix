{
  programs.kitty = {
    enable = true;
    font.name = "JetBrains Mono";
    font.size = 12;
    theme = "Catppuccin-Mocha";

    settings = {
      background_opacity = "0.9";
      enable_audio_bell = "no";
      scrollback_lines = "10000";
      copy_on_select = "yes";
    };
  };
}