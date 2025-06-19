{
  plugins.avante = {
    lazyLoad.settings.event = ["DeferredUIEnter"];
    settings = {
      provider = "claude";
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com";
          extra_request_body = {
            max_tokens = 4096;
            temperature = 0;
          };
          model = "claude-3-5-sonnet-20240620";
        };
      };
    };
  };
}
