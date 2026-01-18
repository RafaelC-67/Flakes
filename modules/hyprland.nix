{ pkgs, ... }:
{
  imports = [ ./apps/foot.nix ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      bind = SUPER, T, exec, foot
      bind = SUPER, Q, killactive'';
  };
}
