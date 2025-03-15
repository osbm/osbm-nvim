{
  plugins.cmp = {
    autoEnableSources = true;
    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "cmdline"; }
      ];
      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
    };
  };
}