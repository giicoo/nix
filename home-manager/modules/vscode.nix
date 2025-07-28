{pkgs, ... }:{
    programs.vscode = {
        enable = true;
        profiles.default.extensions = with pkgs.vscode-extensions; [
            ms-toolsai.jupyter
            ms-python.python
            github.github-vscode-theme
            bbenoist.nix
            ms-dotnettools.csharp
        ];
    };
}
