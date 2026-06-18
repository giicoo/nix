{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake
      {inherit inputs;}
      {
        options = {
          flake.homeModules = inputs.nixpkgs.lib.mkOption {
            type = inputs.nixpkgs.lib.types.attrsOf inputs.nixpkgs.lib.types.raw;
            default = {};
            description = "Коллекция моих модулей Home Manager";
          };
        };

        imports = [
          (inputs.import-tree ./modules)
        ];
      };
}
