{
  description =
    "My custom neovim configuration that has been mixed and matched from various sources";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # https://gerschtli.github.io/nix-formatter-pack/nix-formatter-pack-options.html
    nix-formatter-pack = {
      url = "github:Gerschtli/nix-formatter-pack";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixpkgs, nixvim, nix-formatter-pack, ... }:
    let
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
            nixfmt.enable = true;
            statix.enable = true;
          };
        });

      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          mkNixvim = specialArgs:
            nixvim.legacyPackages.${system}.makeNixvimWithModule {
              inherit pkgs;

              module = ./.;

              extraSpecialArgs = specialArgs // {
                inherit pkgs;

              };
            };
        in {
          default = mkNixvim { };
          lite = mkNixvim { withLSP = false; };
        });
    };
}
