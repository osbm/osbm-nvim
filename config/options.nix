{
  opts = {
    # Enable relative line numbers
    number = true;
    relativenumber = true;

    # show spaces tabs and trailing spaces
    list = true;
    listchars = "tab:» ,trail:·,multispace:·,lead: ,nbsp:⎕";

    # when i press tab i want to see spaces
    expandtab = true;
    tabstop = 4; # Number of spaces that a <Tab> in the file counts for.
    shiftwidth = 4; # how many spaces are added in an indent
    softtabstop = 4; # how many spaces are added when pressing tab
    smarttab =
      true; # When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.
    # TODO: i want to see 4 spaces when i press tab in python and 2 spaces in nix using setlocal
    # is it possible for me to set this per language?

  };
}
