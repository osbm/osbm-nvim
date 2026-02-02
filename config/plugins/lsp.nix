{
  lib,
  pkgs,
  self,
  ...
}: {
  plugins.lsp.servers = {
    astro.enable = true;
    dockerls.enable = true;
    nixd = {
      enable = true;
      settings = let
        flake = ''(builtins.getFlake "${self}")'';
      in {
        nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
        formatting.command = ["${lib.getExe pkgs.nixfmt}"];
      };
    };
    pyright.enable = true;
    typos_lsp = {
      enable = true;
      extraOptions.init_options.diagnosticSeverity = "Hint";
    };
  };
}
