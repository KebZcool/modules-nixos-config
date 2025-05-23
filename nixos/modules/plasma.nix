{ lib, config, pkgs, ... }:

{

  # Enable the KDE Plasma Desktop Environment.
  services = {
      displayManager = {
        defaultSession = "plasma";
        sddm = {
          enable = true;
          theme = "breeze";
          autoNumlock = true; 
        };
      };

  desktopManager.plasma6.enable = true;
  };

  documentation.nixos.enable = false;

  # Kdeconnect
  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    # Catppucin
    catppuccin-kde
  ];

  environment = {
    plasma6.excludePackages = [ pkgs.kdePackages.discover ];

  };
}
