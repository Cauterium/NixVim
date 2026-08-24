{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  outputs = {
    nixvim,
    flake-parts,
    ...
  } @ inputs: let
    inherit (inputs.nixpkgs) lib;
    inherit (lib.fileset) toList fileFilter;
    isNixModule = file: file.hasExt "nix" && !lib.hasPrefix "_" file.name;
    importTree = path: toList (fileFilter isNixModule path);
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem = {system, ...}: let
        configuration = nixvim.lib.evalNixvim {
          inherit system;
          modules = importTree ./modules;
        };
      in {
        checks.default = configuration.config.build.test;

        packages.default = configuration.config.build.package;
      };
    };
}
