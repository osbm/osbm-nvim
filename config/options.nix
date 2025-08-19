{
  opts = {
    # Enable relative line numbers
    number = true;
    relativenumber = true;

    # show spaces tabs and trailing spaces
    list = true;
    listchars = "tab:» ,trail:·,multispace:·,lead: ,nbsp:⎕";

    # Tab options
    tabstop =
      2; # Number of spaces a <Tab> in the text stands for (local to buffer)
    shiftwidth =
      2; # Number of spaces used for each step of (auto)indent (local to buffer)
    softtabstop =
      0; # If non-zero, number of spaces to insert for a <Tab> (local to buffer)
    expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
    autoindent = true; # Do clever autoindenting
    # TODO: i want to see 4 spaces when i press tab in python and 2 spaces in nix using setlocal
    # is it possible for me to set this per language?

    # folding
    foldmethod = "expr";
    foldexpr = "nvim_treesitter#foldexpr()";
    foldlevel = 99; # Folds with a level higher than this number will be closed
    foldcolumn = "1";
    foldenable = true;
    foldlevelstart = -1;
    fillchars = {
      horiz = "━";
      horizup = "┻";
      horizdown = "┳";
      vert = "┃";
      vertleft = "┫";
      vertright = "┣";
      verthoriz = "╋";

      eob = " ";
      diff = "╱";

      fold = " ";
      foldopen = "";
      foldclose = "";

      msgsep = "‾";
    };
  };
}
