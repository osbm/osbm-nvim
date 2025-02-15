{ self, lib, pkgs, ... }:

{
  imports = [
    ./mini.nix
  ];

  plugins = {
    treesitter = {
      enable = true;
      # folding = true; # i dont like the way it starts neovim with everything folded
    };

    todo-comments.enable = true;

    lsp = {
      servers = {
        nixd = {
          enable = true;
          settings = let flake = ''(builtins.getFlake "${self}")'';
          in {
            nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
            formatting = {
              command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            };
          };
        };
        typos_lsp = {
          enable = true;
          extraOptions = { init_options = { diagnosticSeverity = "Hint"; }; };
        };
        pylsp = {
          enable = true;
          settings = {
            configurationSources = [ "flake8" ];
            plugins = {
              pycodestyle = {
                enabled = true;
                maxLineLength = 120;
              };
              flake8 = {
                enabled = true;
                maxLineLength = 120;
              };
            };
          };

        };
        astro = { enable = true; };
        arduino_language_server = { enable = true; };
        bashls = { enable = true; };
        clangd = { enable = true; };
        dartls = { enable = true; };
        lua_ls = { enable = true; };
        mdx_analyzer = { enable = true; };
        fish_lsp = { enable = true; };
        docker_compose_language_service = { enable = true; };
        dockerls = { enable = true; };
        marksman = { enable = true; };
      };
    };

    lualine = {
      enable = true;
    };

    cmp = {
      # TODO read what this does
      # basically, it's a completion plugin
      enable = true;
      autoEnableSources = true;
    };

    oil.enable = true; # shell scripting

    #telescope
    telescope = {
      enable = true;
    };
    web-devicons.enable = true; # be concious of this choice
  };
}
