{
  config = {
    clipboard = {
      providers.wl-copy.enable = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
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
  };
}
