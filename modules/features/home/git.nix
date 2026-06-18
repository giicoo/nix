{ self, inputs, ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      userName  = "giicoo";
      userEmail = "giicoo.gm@gmail.com";
      extraConfig = {
          url."git@gitverse.ru:".insteadOf = "https://gitverse.ru/";
      };
    };
  };
}
