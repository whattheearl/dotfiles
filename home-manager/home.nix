{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  home.username = "jon";
  home.homeDirectory = "/home/jon";
  home.stateVersion = "26.05";

  home.packages = [
    pkgs.age
    pkgs.bun
    pkgs.cmake
    pkgs.fd
    pkgs.feh
    pkgs.fzf
    pkgs.htop
    pkgs.jq
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.rsync
  ];

  xdg.enable = true;
  xdg.configFile = {
    nvim.source = ../nvim;
  };

  programs.librewolf = {
    enable = true;
    profiles.default.extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
    ];
  };

  programs.firefox = {
    enable = true;
    profiles.default.extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
    ];
  };
  programs.neovim.enable = true;
  programs.yt-dlp.enable = true;
}


