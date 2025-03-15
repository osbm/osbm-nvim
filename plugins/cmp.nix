{
  plugins.cmp = {
    autoEnableSources = true;
    settings = {
      sources = [
        # LSP source
        { name = "nvim_lsp"; }
        # For path completion
        { name = "path"; }
        # For buffer completion
        { name = "buffer"; }
        # For command line completion
        { name = "cmdline"; }
      ];
      mapping = {
        # <CR> means enter
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Tab>" = "cmp.mapping.select_next_item()";
        "<S-Tab>" = "cmp.mapping.select_prev_item()";
        "<C-e>" = "cmp.mapping.close()";
      };
    };
  };
}