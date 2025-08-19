{
  plugins.avante = {
    lazyLoad.settings.event = ["DeferredUIEnter"];
    settings = {
      # provider = "ollama";
      # provider = "claude";
      providers = {
      #   claude = {
      #     endpoint = "https://api.anthropic.com";
      #     extra_request_body = {
      #       max_tokens = 4096;
      #       temperature = 0;
      #     };
      #     model = "claude-3-5-sonnet-20240620";
      #   };
        ollama = {
          endpoint = "http://localhost:11434";
          model = "qwen2.5-coder:32b";
        };
      };
    };
  };
}
