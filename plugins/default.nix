{
  # settings of these plugins live in their respective files
  imports = [
    ./blink-cmp.nix
    ./cmp.nix
    ./comment.nix
    ./gitsigns.nix
    ./lsp.nix
    ./mini.nix
    ./oil.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  plugins = {
    # todo comments highlighter
    todo-comments.enable = true;

    # a statusline plugin
    lualine.enable = true;

    # syntax highlighting
    treesitter.enable = true;

    # completion plugin
    cmp.enable = false;

    # blink completion plugin
    blink-cmp.enable = true;

    # Extensible UI for Neovim notifications and LSP progress messages.
    fidget.enable = true;

    # A navigation plugin that uses lsp symbols to provide a breadcrumb trail
    navic.enable = true; # TODO: not seeing the output rn

    # fast create folders and files
    oil.enable = true;

    # a file explorer
    telescope.enable = true;

    # vim exercises
    vim-be-good.enable = true;

    # Provides Nerd Font icons
    web-devicons.enable = true;

    # better ui experience
    noice.enable = true;

    # an introduction plugin
    mini.enable = true; # TODO look more into the mini plugin

    # cursor animation
    smear-cursor.enable = true;

    # add buffer tab plugin
    bufferline.enable = true;

    # git integration
    gitsigns.enable = true;

    # commenting related plugin
    comment.enable = true;

    # lsp support
    lsp.enable = true;

    # gives me hardtime about my bad habits
    hardtime.enable = false; # TODO: enable when I get used to my new keyboard

    which-key.enable = true;
  };
}
