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

      bindl = , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bindl = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindl = Super+Shift, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindle = , XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bindle = , XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
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
