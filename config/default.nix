{pkgs, ...}: {
  imports = [
    ./colorscheme.nix
    ./options.nix
    ./plugins
    ];

  config = {
    # Use <Space> as leader key
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    # Set 'vi' and 'vim' aliases to nixvim
    viAlias = true;
    vimAlias = true;

    # Setup clipboard support
    clipboard = {
      # Use xsel as clipboard provider
      #   providers.xsel.enable = true;

      # Sync system clipboard
      register = "unnamedplus";
    };
    extraPackages = with pkgs; [
      nix-inspect
      nixd
      git
      git-lfs
      cloc
      ripgrep
      lazygit
      black
      fd
      ripgrep
    ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "LazyGit (root dir)";
      };
    }
  ];
extraPlugins = with pkgs.vimPlugins; [
    lazygit-nvim
  ];

  extraConfigLua = ''
    require("telescope").load_extension("lazygit")
  '';
    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };
  };
}
