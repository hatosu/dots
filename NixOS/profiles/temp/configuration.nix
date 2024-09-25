{ config, pkgs, lib, inputs, ... }:

{
  
  imports = 
    [
      ./hardware-configuration.nix
    ];

  #choose linux kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  #setup bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 100;

  #define hostname
  networking.hostName = "nixos";

  #setup hatosu as user
  users.users.hatosu = {
    isNormalUser = true;
    home = "/home/hatosu";
    description = "guh... mlem -hatosu";
    extraGroups = [ "wheel" "libvirtd" "kvm" ];
    initialPassword = ";";
  };

  #properly set default locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  #setup timezone
  time.timeZone = "America/Los_Angeles";

  #setup network manager
  networking.networkmanager.enable = true;

  #setup firewall
  networking.firewall.enable = true;

  #enable polkit
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };

  #set zsh as default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  #setup gnome and omit ly (FOR TEMP PROFILE ONLY)
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  }

  #fuse stuff
  programs.fuse.userAllowOther = true;

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration
  system.stateVersion = "24.05"; # Did you read the comment?

}
