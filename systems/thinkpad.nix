{ pkgs, ... }:
{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  boot.loader = {
    timeout = 8;
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      efiSupport = true;
    };
  };

  networking = {
    hostName = "thinkpad";
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    modemmanager = {
      enable = true;
    };
  };

  time = {
    timeZone = "Asia/Jakarta";
    hardwareClockInLocalTime = true;
  };

  hardware = {
    bluetooth.enable = true;
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.zsh;
    users = {
      rafael = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
      };
    };
  };

  programs = {
    zsh.enable = true;
  };

  environment.systemPackages = with pkgs; [ nixfmt ];

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  system.stateVersion = "25.11";
}
