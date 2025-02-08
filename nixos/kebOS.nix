{
  imports = [
    # base config with pkgs and services
    ./modules/configuration.nix
    ./users/user.nix

    # modules
    ./modules/pipewire.nix
    ./modules/bluetooth.nix
    ./modules/printing.nix
    ./modules/gaming.nix
    ./modules/appimage.nix
    ./modules/vm.nix
    ./modules/tor.nix
    ./modules/networking.nix 
    ./modules/ssh.nix
    ./modules/printing.nix
    ./modules/firewall.nix
    ./modules/ollama.nix  
    ./modules/firefox.nix
    ./modules/packages.nix
    ./modules/optimisation.nix
    ./modules/kde.nix
    ./modules/boot.nix
    

    # hardware
    ./hardware/hardware-configuration.nix
    

    # services
    ./services/flatpak.nix
  ];

  # networking.hostName = "kebOS";
}
