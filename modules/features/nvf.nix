{ self, inputs, ... }: {
  flake.nixosModules.nvim = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myNvim
    ] ++ (with pkgs; [
      ripgrep
      fd
      git
      lazygit
      docker
      docker-compose
      # ВАЖНО: без Nerd Font иконки/рамки в neo-tree, статусбаре
      # и телескопе будут выглядеть битыми — поставь шрифт и выбери
      # его в настройках терминала (Alacritty/Kitty/WezTerm/etc).
      nerd-fonts.jetbrains-mono
    ]);
    environment.shellAliases.nvim =
      lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.myNvim;
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNvim = (inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [{
        vim = {
          extraPlugins = {
            vague = {
              package = pkgs.vimPlugins.vague-nvim;
              setup = ''
                require('vague').setup({ transparent = false })
                vim.cmd('colorscheme vague')
              '';
            };
          };

          options = {
            number = true;
            relativenumber = true;
            cursorline = true;
            scrolloff = 8;
            updatetime = 300;
            wrap = false;
            winborder = "rounded";
          };

          lsp = {
            enable = true;
            formatOnSave = true;
            trouble.enable = true;
          };

          autocomplete.nvim-cmp.enable = true;
          autopairs.nvim-autopairs.enable = true;

          treesitter = {
            enable = true;
            context.enable = true;
          };

          languages = {
            enableLSP = true;
            enableFormat = true;
            enableTreesitter = true;
            enableExtraDiagnostics = true;

            nix.enable = true;
            bash.enable = true;
            markdown.enable = true;
            yaml.enable = true;
            json.enable = true;
            docker.enable = true;

            go.enable = true;
            rust.enable = true;
            python.enable = true;
          };

          telescope = {
            enable = true;
            setupOpts.defaults = {
              prompt_prefix = " ";
              selection_caret = " ";
              layout_config.prompt_position = "top";
              sorting_strategy = "ascending";
            };
          };

          filetree.neo-tree.setupOpts = {
            close_if_last_window = true;
            popup_border_style = "rounded";
            enable_git_status = true;
            enable_diagnostics = true;

            default_component_configs = {
              indent = {
                indent_size = 2;
                padding = 1;
                with_markers = true;
                indent_marker = "│";
                last_indent_marker = "└";
                with_expanders = true;
                expander_collapsed = "";
                expander_expanded = "";
              };
              icon = {
                folder_closed = "";
                folder_open = "";
                folder_empty = "";
                default = "";
              };
              git_status.symbols = {
                added = "";
                modified = "";
                deleted = "✖";
                renamed = "󰁕";
                untracked = "";
                ignored = "";
                unstaged = "󰄱";
                staged = "";
                conflict = "";
              };
            };

            window = {
              position = "left";
              width = 32;
              mappings = {
                "<space>" = "toggle_node";
                "<cr>" = "open";
                "a" = "add";
                "d" = "delete";
                "r" = "rename";
                "y" = "copy_to_clipboard";
                "x" = "cut_to_clipboard";
                "p" = "paste_from_clipboard";
                "R" = "refresh";
                "H" = "toggle_hidden";
              };
            };
          };

          git = {
            enable = true;
            gitsigns.enable = true;
          };

          statusline.lualine.enable = true;
          tabline.nvimBufferline.enable = true;
          dashboard.alpha.enable = true;

          visuals = {
            nvim-web-devicons.enable = true;
            indent-blankline.enable = true;
            highlight-undo.enable = true;
          };

          comments.comment-nvim.enable = true;

          terminal.toggleterm = {
            enable = true;
            lazygit.enable = true;
          };

          binds.whichKey = {
            enable = true;
            setupOpts.preset = "modern";
          };

          keymaps = [
            { key = "<leader>e"; mode = [ "n" ]; action = "<CMD>Neotree toggle<CR>"; desc = "Toggle file explorer"; }
            { key = "<leader>ff"; mode = [ "n" ]; action = "<CMD>Telescope find_files<CR>"; desc = "Find files"; }
            { key = "<leader>fg"; mode = [ "n" ]; action = "<CMD>Telescope live_grep<CR>"; desc = "Live grep"; }
            { key = "<leader>fb"; mode = [ "n" ]; action = "<CMD>Telescope buffers<CR>"; desc = "Buffers"; }
            { key = "<leader>fk"; mode = [ "n" ]; action = "<CMD>Telescope keymaps<CR>"; desc = "Show all keymaps"; }
            { key = "<leader>gg"; mode = [ "n" ]; action = "<CMD>LazyGit<CR>"; desc = "LazyGit"; }
            { key = "<leader>tt"; mode = [ "n" ]; action = "<CMD>ToggleTerm<CR>"; desc = "Toggle terminal"; }
            { key = "<leader>p"; mode = [ "n" "v" ]; action = "<CMD>lua vim.lsp.buf.format()<CR>"; desc = "Format file"; }
          ];
        };
      }];
    }).neovim;

    apps.nvim = {
      type = "app";
      program = lib.getExe self'.packages.myNvim;
    };
  };
}
