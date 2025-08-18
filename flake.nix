{
  description = "My custom neovim configuration that has been mixed and matched from various sources";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # https://gerschtli.github.io/nix-formatter-pack/nix-formatter-pack-options.html
    nix-formatter-pack = {
      url = "github:Gerschtli/nix-formatter-pack";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    nix-formatter-pack,
    ...
  }: let
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
  in {
    formatter = forAllSystems (system:
      nix-formatter-pack.lib.mkFormatter {
        pkgs = nixpkgs.legacyPackages.${system};
        config.tools = {
          deadnix.enable = true;
          alejandra.enable = true;
          statix.enable = true;
        };
      });

    packages = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};
      mkNixvim = specialArgs:
        nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          module = ./config;
          extraSpecialArgs =
            specialArgs
            // {
              inherit pkgs self;
            };
        };
    in rec {
      default = mkNixvim {};
      lite = mkNixvim {withLSP = false;};

      default-print-init = default.config.build.printInitPackage;
      lite-print-init = lite.config.build.printInitPackage;
    });
  };
}
