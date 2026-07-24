{ self, inputs, ... }: {
  flake.nixosModules.nvim = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myNvim
    ];
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
                require('vague').setup({})
                vim.cmd('colorscheme vague')
              '';
            };
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

            nix.enable = true;
            python.enable = true;
            bash.enable = true;
          };

          telescope.enable = true;
          filetree.neo-tree.enable = true;

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

        };
      }];
    }).neovim;

    apps.nvim = {
      type = "app";
      program = lib.getExe self'.packages.myNvim;
    };
  };
}
