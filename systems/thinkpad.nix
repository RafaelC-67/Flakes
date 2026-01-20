{ pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/nh.nix
  ];

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
        hashedPassword = "79063e8037fff16d297a1fe65136f1251126cddb2cc9870ecf8d653835538e85";
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
      };
    };
  };

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [ nixfmt ];

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  system.stateVersion = "25.11";
}
