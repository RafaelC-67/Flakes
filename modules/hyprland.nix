{ pkgs, ... }:
{
  imports = [ ./apps/foot.nix ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      #Binds
      bind = SUPER, T, exec, foot
      bind = SUPER, W, exec, firefox
      bind = SUPER, Q, killactive
      # Monitor
      monitor = , preferred, auto, 1
      # Input
      input {
        touchpad {
          natural_scroll = true
          }
      }'';
  };
}
