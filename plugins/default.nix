{
  imports = [
    ./lsp
    ./mini.nix
  ];

  plugins = {
    treesitter = {
      enable = true;
      # folding = true; # i dont like the way it starts neovim with everything folded
    };

    todo-comments.enable = true;
    lualine.enable = true;

    # cmp = {
    #   # TODO read what this does
    #   # basically, it's a completion plugin
    #   enable = true;
    #   autoEnableSources = true;
    # };
    # cmp-nvim-lsp.enable = true;

    blink-cmp.enable = true;

    oil.enable = true; # shell scripting

    #telescope
    telescope.enable = true;
    web-devicons.enable = true; # be concious of this choice
  };
}
