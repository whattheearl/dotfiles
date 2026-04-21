{ config, pkgs, ... }:


{
  home.username = "jon";
  home.homeDirectory = "/home/jon";
  home.stateVersion = "26.05";

  xdg.enable = true;

  home.packages = [
    pkgs.chezmoi
    pkgs.htop
  ];

  xdg.configFile.nvim.source = ../nvim;

  programs.home-manager.enable = true;
  programs.neovim = {
    enable = true;
  };
}


