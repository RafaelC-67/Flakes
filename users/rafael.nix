{ pkgs, ... }:
{
  imports = [
    ../modules/zsh.nix
  ];

  home = {
    username = "rafael";
    homeDirectory = "/home/rafael";

    packages = with pkgs; [
      fastfetch
    ];

    stateVersion = "25.11";
  };
}
