{ config, pkgs, ... }:

{
    home.username = "jon";
    home.homeDirectory = "/home/jon";
    home.stateVersion = "26.05";

    xdg.enable = true;
    xdg.configFile = {
        "mimeapps.list".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/mimeapps.list";
        i3.source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/i3";
        nix.source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/nix";
        sway.source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/sway";
        waybar.source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/waybar";
        wofi.source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/wofi";
        "home-manager".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/home-manager";
        nvim.source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/nvim";
    };

    home.file = {
        ".bunfig.toml".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/bunfig.toml";
        ".editorconfig".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/editorconfig";
        ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/git/gitconfig";
        ".npmrc".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/npmrc";
        ".ripgreprc".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/ripgreprc";
        ".vimrc".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/vimrc";
        ".xorg.conf.d".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/xorg.conf.d";
        ".xprofile".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/xprofile";
        ".Xresources".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/Xresources";
        ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "/home/jon/wte/dotfiles/zsh/zshrc";
    };

    nixpkgs.config.allowUnfree = true;

    home.packages = [
        pkgs.age
        pkgs.bun
        pkgs.brightnessctl
        pkgs.chromium
        pkgs.cmake
        pkgs.fd
        pkgs.feh
        pkgs.firefox-bin
        pkgs.fzf
        pkgs.git
        pkgs.htop
        pkgs.jq
        pkgs.lazygit
        pkgs.luarocks
        pkgs.nodejs
        pkgs.neovim
        pkgs.rbw
        pkgs.ripgrep
        pkgs.rsync
        pkgs.sqlite
        pkgs.tldr
        pkgs.zsh
    ];
}
