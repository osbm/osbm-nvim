{
  config,
  lib,
  ...
}: {
  plugins.oil = {};
  # add this keymaps only if oil plugin is enabled
  keymaps = lib.mkIf config.plugins.oil.enable [
    {
      action = "<cmd>Oil<CR>";
      key = "-";
      options = {
        silent = true;
        # TODO what does silent do?
      };
    }
  ];
}
