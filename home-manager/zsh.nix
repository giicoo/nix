{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/nix";
      in {
      nrs = "sudo nixos-rebuild switch --flake ${flakeDir}";

      hms = "home-manager switch --flake ${flakeDir}";

      conf = "zeditor ${flakeDir}";

      ll = "ls -l";
      v = "nvim";
      se = "sudoedit";
      ff = "fastfetch";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";


    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "dirhistory" "history"];
      theme = "agnoster";
    };
  };
}
