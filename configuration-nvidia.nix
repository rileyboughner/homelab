{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
  ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = false;
  };

  hardware.nvidia-container-toolkit.enable = true;
}
