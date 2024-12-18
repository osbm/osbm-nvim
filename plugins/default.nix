{
  plugins = {
    treesitter = {
      enable = true;
      # folding = true; # i dont like the way it starts neovim with everything folded
    };

    mini = {
      enable = true;
      modules = {
        starter = {
          header = ''
                       _                    _
              ___  ___| |__  _ __ ___    __| | _____   __
             / _ \/ __| '_ \| '_ ` _ \  / _` |/ _ \ \ / /
            | (_) \__ \ |_) | | | | | || (_| |  __/\ V /
             \___/|___/_.__/|_| |_| |_(_)__,_|\___| \_/

          '';
        };
      };
    };


  };
}
