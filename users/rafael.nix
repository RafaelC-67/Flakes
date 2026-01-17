{ pkgs, ... }:
{
  imports = [
    ../modules/zsh.nix
    ../modules/hyprland.nix
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
