{ self, inputs, ... }: {
  flake.nixosModules.zsh = { pkgs, config, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases =
        let flakeDir = "~/nix";
        in {
          nrs = "sudo nixos-rebuild switch --flake ${flakeDir}#tokito";
          conf = "zeditor --new ${flakeDir}";
          confhx = "hx ${flakeDir}";
          ll = "ls -l";
          v = "nvim";
          se = "sudoedit";
          ff = "fastfetch";
          zz = "zeditor --new .";
        };

      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" "dirhistory" "history" "z" ];
      };
    };

    environment.systemPackages = with pkgs; [
      zsh-autosuggestions
      zsh-syntax-highlighting
      zsh-powerlevel10k
    ];
  };
}
