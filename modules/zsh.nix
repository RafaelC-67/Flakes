{ ... }:
{
  imports = [ ./starship.nix ];

  programs = {
    zsh = {
      enable = true;

      history = {
        share = true;
        extended = true;
        ignoreAllDups = true;
        ignoreSpace = true;
      };
      autocd = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;

      zsh-abbr = {
        enable = true;
        abbreviations = {
          # Nix
          switch = "nh os switch --ask --impure";
          clean = "nh clean all";
          # Misc
          ff = "fastfetch";
        };
      };

      shellAliases = {
        cd = "z";
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    atuin = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
