{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "server";

  time.timeZone = "UTC";

  environment.sessionVariables = {
    TANK_ROOT = "/mnt/tank";
  };


  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [ "wheel" "docker" ];
  };

  security.sudo.wheelNeedsPassword = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true; # set this to false after setting up ssh key
      PermitRootLogin = "no";
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };

  virtualisation.docker.enable = true;

  system.stateVersion = "24.11";
}
