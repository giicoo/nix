{ pkgs, inputs, ... }:

{
  imports = [
    ./modules/bundle.nix
    ./zsh.nix
  ];

  home = {
    username = "giicoo";
    homeDirectory = "/home/giicoo";
    stateVersion = "25.05";
  };

  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
  };
}