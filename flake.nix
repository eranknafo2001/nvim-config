{
  description = "Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    nixvim,
    flake-parts,
    nixpkgs,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {system, ...}: let
        pkgs = import nixpkgs {inherit system;};
        lib = nixpkgs.lib.extend nixvim.lib.overlay;

        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = {
            inherit pkgs lib;
          };
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages = {
          default = nvim;
        };
      };
    };
}
