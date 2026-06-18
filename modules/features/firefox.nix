{ self, inputs, ... }: {
  # 1. Системный модуль NixOS (паттерн сохранен)
  flake.nixosModules.firefox = { pkgs, ... }: {
    programs.firefox = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myFirefox;

      policies = {
        LegacyProfiles = true;
        Preferences = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
      };
    };
  };

  # 2. Секция perSystem со специальным пробросом .override (passthru)
  perSystem = { pkgs, ... }: {
    packages.myFirefox = pkgs.symlinkJoin {
      name = "firefox-with-userchrome";
      paths = [ pkgs.firefox ];

      # Пробрасываем оригинальный метод .override, чтобы модуль NixOS не падал
      passthru = {
        inherit (pkgs.firefox) override;
      };

      postBuild = ''
        # Создаем директорию для стилей внутри нашего кастомного пакета
        mkdir -p $out/lib/firefox/distribution/chrome

        # Записываем userChrome.css
        cat << 'EOF' > $out/lib/firefox/distribution/chrome/userChrome.css
        #sidebar-header {
          display: none !important;
        }

        #TabsToolbar {
          display: none !important;
        }
        EOF

        # Принудительно включаем stylesheets для всех будущих профилей
        mkdir -p $out/lib/firefox/defaults/pref
        cat << 'EOF' > $out/lib/firefox/defaults/pref/user-prefs.js
        pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
        EOF
      '';
    };
  };
}
