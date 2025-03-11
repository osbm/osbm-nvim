{
  plugins.treesitter = {
    # folding = true; # i dont like the way it starts neovim with everything folded
    settings = {
      ensure_installed = [
        "python"
        "astro"
        "just"
        "dockerfile"
        "json"
        "yaml"
        "lua"
        "nix"
        "c"
        "markdown"
      ];
      highlight = { enable = true; };
    };
  };
}