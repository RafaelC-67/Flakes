{ pkgs, ... }:
{

  home.packages = with pkgs; [ kitty ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
