{pkgs, ...}:

{
  imports = [ ./config ./plugins ];

  config = {
    # Use <Space> as leader key
    # globals.mapleader = " ";

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
    ];

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
