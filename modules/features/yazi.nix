{ self, inputs, ... }: {
  flake.nixosModules.yazi = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      yazi
      imv
      mpv
      (writeShellScriptBin "yz-fp" ''
        #!/usr/bin/env bash
        if [ -n "$EDITOR_PANE_ID" ]; then
          for selected_file in "$@"
          do
            zellij action send-keys --pane-id "$EDITOR_PANE_ID" "Esc"
            zellij action write-chars --pane-id "$EDITOR_PANE_ID" ":open \"$selected_file\""
            zellij action send-keys --pane-id "$EDITOR_PANE_ID" "Enter"
          done
          zellij action close-pane
        else
          exec hx "$@"
        fi
      '')
      (writeShellScriptBin "floating-yazi" ''
        #!/usr/bin/env bash
        zellij run -c -f --width 80% --height 80% -x 10% -y 10% -- env EDITOR_PANE_ID="$ZELLIJ_PANE_ID" yazi "$PWD"
      '')
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];

    environment.etc."yazi/flavors/vague.yazi/flavor.toml".source =
      "${inputs.vague-yazi}/flavor.toml";
    environment.etc."yazi/flavors/vague.yazi/tmtheme.xml".source =
      "${inputs.vague-yazi}/tmtheme.xml";
    environment.etc."yazi/theme.toml".text = ''
      [flavor]
      dark = "vague"
    '';

    environment.etc."yazi/yazi.toml".text = ''
      [opener]
      image = [
        { run = 'imv %s', desc = "Open image", orphan = true },
      ]
      video = [
        { run = 'mpv %s', desc = "Open video", orphan = true },
      ]
      helix = [
        { run = 'yz-fp %s', desc = "Use yazi as file picker within helix", block = true },
      ]

      [open]
      rules = [
        { mime = "image/*", use = "image" },
        { mime = "video/*", use = "video" },
        { url = "*", use = "helix" },
      ]
    '';

    environment.sessionVariables = {
      YAZI_CONFIG_HOME = "/etc/yazi";
    };
  };
}
