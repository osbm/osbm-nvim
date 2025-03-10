{pkgs, ...}: {
  imports = [
    ./lsp
    ./mini.nix
  ];

  plugins = {
    treesitter = {
      enable = true;
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

    todo-comments.enable = true;
    lualine.enable = true;

    # cmp = {
    #   # TODO read what this does
    #   # basically, it's a completion plugin
    #   enable = true;
    #   autoEnableSources = true;
    # };
    cmp-nvim-lsp.enable = true;

    # blink completion
    blink-cmp.enable = true;
    blink-compat.enable = true;

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

    web-devicons.enable = true; # be concious of this choice

    # TODO: add floating command inputter

  };
}
