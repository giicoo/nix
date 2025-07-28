{pkgs, ...}:
{   
    programs.zsh.enable = true;

    users = {
        defaultUserShell = pkgs.zsh;

        users.giicoo = {
            isNormalUser = true;
            description = "giicoo";
            extraGroups = [ "networkmanager" "wheel" "input" "docker" ];
            packages = with pkgs; [];
        };
    }; 
}