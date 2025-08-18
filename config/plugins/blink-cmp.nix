{
  plugins.blink-cmp = {
    settings = {
      snippets = {
        preset = "luasnip";
      };
      sources = {
        default = [
          "lsp"
          "path"
          "buffer"
          "copilot"
        ];
        providers = {
          copilot = {
            async = true;
            module = "blink-copilot";
            name = "copilot";
            score_offset = 100;
            # Optional configurations
            opts = {
              max_completions = 3;
              max_attempts = 4;
              kind = "Copilot";
              debounce = 750;
              auto_refresh = {
                backward = true;
                forward = true;
              };
            };
          };
        };
      };
    };
  };
}
