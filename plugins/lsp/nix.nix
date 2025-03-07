{lib, pkgs, self, ...}: {
  plugins.lsp.servers.nixd = {
    enable = true;
    settings = let flake = ''(builtins.getFlake "${self}")'';
    in {
      nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
      formatting = {
        command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
      };
    };
  };
}