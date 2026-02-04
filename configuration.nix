{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "server";

  time.timeZone = "UTC";

  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [ "wheel" "docker" ];
  };

  security.sudo.wheelNeedsPassword = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
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
