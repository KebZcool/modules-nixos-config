# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    plymouth = {
      enable = true;
      theme = "black_hud";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = ["black_hud"];
        })
      ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      kernelModules = [];
      verbose = false;
      systemd = {
        enable = true;
        storePaths = [config.console.font];
      };
    };
    extraModulePackages = with config.boot.kernelPackages; [ nvidia_x11 ];
    kernelModules = ["kvm-intel"];
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "nowatchdog"
      "modprobe.blacklist=iTCO_wdt" # Turn off Intel hardware watchdog
      #"modprobe.blacklist=sp5100_tco" # Turn off AMD hardware watchdog
    ];

    loader = {
      grub = {
        enable = true;
        theme = "${pkgs.libsForQt5.breeze-grub}/grub/themes/breeze";
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        fsIdentifier = "label";
        splashImage = ../../assets/raven_eats_eye_2556x1440.png;
        splashMode = "stretch";
      };
      timeout = 5;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/19357ee1-ca37-4b83-97a8-b5ea0ecd5aa4";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/10C1-2555";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/19357ee1-ca37-4b83-97a8-b5ea0ecd5aa4";
    fsType = "btrfs";
    options = ["subvol=@home"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/19357ee1-ca37-4b83-97a8-b5ea0ecd5aa4";
    fsType = "btrfs";
    options = ["subvol=@nix"];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/19357ee1-ca37-4b83-97a8-b5ea0ecd5aa4";
    fsType = "btrfs";
    options = ["subvol=@log"];
  };

  fileSystems."/bigboy" = {
    device = "/dev/disk/by-uuid/3ed598b3-03c9-4825-9104-d1681a2db4fe";
    fsType = "btrfs";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/d258ee37-e15a-4b98-b391-a67a3da1d54c";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno2.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.enableAllFirmware = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  services.throttled.enable = true;
}
