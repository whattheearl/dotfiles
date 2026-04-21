{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    packages.x86_64-linux = {
        default = self.packages.x86_64-linux.home-manager;
        home-manager = nixpkgs.legacyPackages.x86_64-linux.home-manager;
    };
  };

}
