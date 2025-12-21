{
  plugins.treesitter = {
    folding.enable = true; # i dont like the way it starts neovim with everything folded
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
        # TODO: add mdx
      ];
      highlight = {enable = true;};
    };
  };
}
