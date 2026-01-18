{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "heavenslab";
        email = "git@zephyremc.xyz";
        signingkey = "93D4AB5457D47756";
      };
      commit.gpgsign = true;
      init.defaultBranch = "main";
    };
  };
}
