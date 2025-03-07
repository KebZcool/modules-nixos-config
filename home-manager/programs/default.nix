{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./bash.nix
    ./zsh.nix
    ./fish.nix
    ./git.nix
    ./alacritty.nix
    ./utils.nix
    ./icons.nix
    ./fonts.nix
  ];

  programs.home-manager.enable = true;

  home.sessionPath = ["$HOME/.local/bin"];

  # Add programs
  home.packages = with pkgs; [
    #vide
  ];
}
