# home.nix

{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.giicoo = {

      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
      };
      search.force = true;

      bookmarks = {
        force = true;
        settings = [
        {
          name = "wikipedia";
          tags = [ "wiki" ];
          keyword = "wiki";
          url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
        }
      ];
      };

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = ''
#sidebar-header {
  display: none;
}

#TabsToolbar {
  display: none;
}

      '';
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
            bitwarden
            ublock-origin
            sidebery
        ];
      };

    };
  };
}
