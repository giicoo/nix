{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
    vscode
    home-manager
    gedit
    git
    openssh
  ];
}
