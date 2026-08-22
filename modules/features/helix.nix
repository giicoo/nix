{ self, inputs, ... }: {
  flake.nixosModules.helix = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      self.packages.${pkgs.stdenv.hostPlatform.system}.tokitoHelix

      go
      python3
      rustup
      nodejs
      docker
    ];

    environment.sessionVariables = {
      EDITOR = "hx";
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.tokitoHelix = inputs.wrapper-modules.wrappers.helix.wrap {
      inherit pkgs;

      settings = {
        theme = "vague";

        editor = {
          auto-save = {
            true = true;
            after-delay = {
              enable = true;
              timeout = 2000;
            };
          };
          line-number = "relative";
          mouse = true;
          cursorline = true;
          bufferline = "always";

          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };

          lsp = {
            display-messages = true;
            display-inlay-hints = true;
          };
        };

        keys.normal = {
          space.w = ":w";
          space.q = ":q";
          space.space = [ ":sh floating-yazi" ];
        };
      };

      themes = {
        vague = builtins.readFile "${inputs.vague-helix}/vague.toml";
      };

      languages = {
        language = [
          {
            name = "go";
            auto-format = true;
            formatter.command = "${pkgs.gotools}/bin/goimports";
            language-servers = [ "gopls" ];
          }
          {
            name = "python";
            auto-format = true;
            formatter = {
              command = "${pkgs.ruff}/bin/ruff";
              args = [ "format" "-" ];
            };
            language-servers = [ "pyright" "ruff" ];
          }
          {
            name = "rust";
            auto-format = true;
            language-servers = [ "rust-analyzer" ];
          }
          {
            name = "javascript";
            auto-format = true;
            formatter = {
              command = "${pkgs.prettier}/bin/prettier";
              args = [ "--parser" "babel" ];
            };
            language-servers = [ "typescript-language-server" ];
          }
          {
            name = "typescript";
            auto-format = true;
            formatter = {
              command = "${pkgs.prettier}/bin/prettier";
              args = [ "--parser" "typescript" ];
            };
            language-servers = [ "typescript-language-server" ];
          }
          {
            name = "markdown";
            auto-format = true;
            formatter = {
              command = "${pkgs.prettier}/bin/prettier";
              args = [ "--parser" "markdown" ];
            };
            language-servers = [ "marksman" ];
          }
          {
            name = "yaml";
            auto-format = true;
            formatter = {
              command = "${pkgs.prettier}/bin/prettier";
              args = [ "--parser" "yaml" ];
            };
            language-servers = [ "yaml-language-server" ];
          }
          {
            name = "dockerfile";
            language-servers = [ "docker-langserver" ];
          }
          {
            name = "toml";
            auto-format = true;
            formatter = {
              command = "${pkgs.taplo}/bin/taplo";
              args = [ "fmt" "-" ];
            };
            language-servers = [ "taplo" ];
          }
          {
            name = "json";
            auto-format = true;
            formatter = {
              command = "${pkgs.prettier}/bin/prettier";
              args = [ "--parser" "json" ];
            };
            language-servers = [ "vscode-json-language-server" ];
          }
          {
            name = "sql";
            language-servers = [ "sqls" ];
          }
        ];

        language-server = {
          gopls.command = "${pkgs.gopls}/bin/gopls";

          pyright = {
            command = "${pkgs.pyright}/bin/pyright-langserver";
            args = [ "--stdio" ];
          };
          ruff = {
            command = "${pkgs.ruff}/bin/ruff";
            args = [ "server" ];
          };

          rust-analyzer.command = "${pkgs.rust-analyzer}/bin/rust-analyzer";

          typescript-language-server = {
            command = "${pkgs.typescript-language-server}/bin/typescript-language-server";
            args = [ "--stdio" ];
          };

          sqls = {
            command = "${pkgs.sqls}/bin/sqls";
          };

          marksman = {
            command = "${pkgs.marksman}/bin/marksman";
            args = [ "server" ];
          };

          yaml-language-server = {
            command = "${pkgs.yaml-language-server}/bin/yaml-language-server";
            args = [ "--stdio" ];
          };

          docker-langserver = {
            command = "${pkgs.dockerfile-language-server-nodejs}/bin/docker-langserver";
            args = [ "--stdio" ];
          };

          taplo = {
            command = "${pkgs.taplo}/bin/taplo";
            args = [ "lsp" "stdio" ];
          };

          vscode-json-language-server = {
            command = "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server";
            args = [ "--stdio" ];
          };
        };
      };
    };
  };
}
