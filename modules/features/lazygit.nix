{ self, inputs, ... }: {
  flake.nixosModules.lazygit = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      lazygit
      delta
    ];

    environment.etc."lazygit/config.yml".text = ''
      # Upstream: vague theme for lazygit
      gui:
        authorColors:
          "*": "#f3be7c"
        theme:
          activeBorderColor:
            - "#aeaed1"
            - "bold"
          inactiveBorderColor:
            - "#606079"
          optionsTextColor:
            - "#606079"
          selectedLineBgColor:
            - "#252530"
          cherryPickedCommitFgColor:
            - "#d8647e"
          cherryPickedCommitBgColor:
            - "bg"
          markedBaseCommitFgColor:
            - "#f3be7c"
          markedBaseCommitBgColor:
            - "bg"
          unstagedChangesColor:
            - "#d8647e"
          defaultFgColor:
            - "#cdcdcd"
        showIcons: false
        border: rounded
        showFileTree: true
        showCommandLog: true

      git:
        pagers:
          - colorArg: always
            pager: ${pkgs.delta}/bin/delta --dark --paging=never
        commit:
          signOff: false
        autoFetch: true

      keybinding:
        universal:
          quit: 'q'
          return: '<esc>'

      update:
        method: never

      # Отключаем авто-миграцию конфига, чтобы lazygit даже не пытался
      # переписать read-only файл в /etc при следующем изменении схемы
      disableStartupPopups: true
    '';

    environment.sessionVariables = {
      LG_CONFIG_FILE = "/etc/lazygit/config.yml";
    };
  };
}
