{
  plugins.cmp = {
    autoEnableSources = true;
    settings = {
      sources = [
        # LSP source
        {
          name = "nvim_lsp";
        }
        # For path completion
        {
          name = "path";
        }
        # For buffer completion
        {
          name = "buffer";
          keyword_length = 5;
        }
        # For command line completion
        { name = "cmdline"; }
      ];
      mapping = {
        # <CR> means enter
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-e>" = "cmp.mapping.close()";
      };
    };
  };
}
