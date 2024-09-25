{ pkgs, lib, config, inputs, ... }: {

  #choose custom linux kernel
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

  #set zsh as default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  #enable ly as login manager (and let it be able to detect hyprland)
  services.displayManager.ly.enable = true;
  programs.hyprland.enable = true;

  #fuse stuff
  programs.fuse.userAllowOther = true;

}
