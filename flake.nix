{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      # We need to use nightly home-manager because it contains this
      # fix we need for nushell nightly:
      # https://github.com/nix-community/home-manager/commit/a69ebd97025969679de9f930958accbe39b4c705
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    packages.x86_64-linux = {
        default = self.packages.x86_64-linux.hello;
        hello = nixpkgs.legacyPackages.x86_64-linux.hello;
        home-manager = nixpkgs.legacyPackages.x86_64-linux.home-manager;
    };
  };

}
