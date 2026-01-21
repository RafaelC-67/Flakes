{ pkgs, ... }:
{
  imports = [
    ../modules/zsh.nix
    ../modules/git.nix
    ../modules/hyprland.nix
    ../modules/nvf.nix
  ];

  home = {
    username = "rafael";
    homeDirectory = "/home/rafael";

    packages = with pkgs; [
      fastfetch
      gnupg
    ];

    stateVersion = "25.11";
  };
}
