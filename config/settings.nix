{
  config = {
    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };

    opts = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      signcolumn = "yes";
      smartindent = true;
      breakindent = true;
      wrap = true;
      linebreak = true;
      cursorline = true;
      scrolloff = 8;
      sidescrolloff = 8;

      foldmethod = "manual";
      foldenable = false;

      termguicolors = true;
      splitright = true;
      splitbelow = true;
    };

    highlight = {
      Comment.fg = "ff00ff";
      Comment.bg = "000000";
      Comment.underline = true;
    };
  };
}
