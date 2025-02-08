{ self, lib, pkgs, ... }:

{
  plugins = {
    treesitter = {
      enable = true;
      # folding = true; # i dont like the way it starts neovim with everything folded
    };

    mini = {
      enable = true;
      modules = {
        starter = {
          header = ''
                       _                    _
              ___  ___| |__  _ __ ___    __| | _____   __
             / _ \/ __| '_ \| '_ ` _ \  / _` |/ _ \ \ / /
            | (_) \__ \ |_) | | | | | || (_| |  __/\ V /
             \___/|___/_.__/|_| |_| |_(_)__,_|\___| \_/

          '';
        };
      };
    };

    todo-comments.enable = true;


    lsp = {
      servers = {
        nixd = {
          enable = true;
          settings =
            let
              flake = ''(builtins.getFlake "${self}")'';
            in
            {
              nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
              formatting = {
                command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
              };
            };
        };
        typos_lsp = {
          enable = true;
          extraOptions = {
            init_options = {
              diagnosticSeverity = "Hint";
            };
          };
        };
        pylsp = {
          enable = true;
          settings = {
            configurationSources = ["flake8"];
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
        astro = {
          enable = true;
        };
        arduino_language_server = {
          enable = true;
        };
        bashls= {
          enable = true;
        };
        clangd = {
          enable = true;
        };
        dartls = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        mdx_analyzer = {
          enable = true;
        };
        fish_lsp = {
          enable = true;
        };
        docker_compose_language_service = {
          enable = true;
        };
        dockerls = {
          enable = true;
        };
        marksman = {
          enable = true;
        };
      };
    };
  };
}
