{pkgs, ...}:
{
    users.users.giicoo = {
        isNormalUser = true;
        description = "giicoo";
        extraGroups = [ "networkmanager" "wheel" "input" ];
        packages = with pkgs; [];
    };
}