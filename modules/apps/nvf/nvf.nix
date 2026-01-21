{ inputs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;
    settings = {
      vim = {
        vimAlias = false;
        viAlias = false;

        options = {
          shiftwidth = 2;
          tabstop = 2;
          conceallevel = 2;
        };

        lineNumberMode = "relNumber";

        globals.mapLeader = " ";

        terminal.toggleterm = {
          enable = true;

          lazygit = {
            enable = true;
          };
        };

        theme = {
          enable = true;
          name = "tokyonight";
          style = "moon";
        };

        autocomplete.nvim-cmp = {
          enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };
        languages = {
          enableTreesitter = true;
          nix = {
            enable = true;
            lsp.servers = [ "nixd" ];
          };
        };
      };
    };
  };
}
