{
  plugins = {
    illuminate.enable = true;
    indent-blankline.enable = true;
    lualine.enable = true;
    neo-tree.enable = true;
    nvim-autopairs.enable = true;
    todo-comments.enable = true;
    treesitter.enable = true;

    trim = {
      enable = true;
      settings = {
        highlight = true;
        ft_blocklist = [
          "checkhealth"
          "lspinfo"
          "neo-tree"
          "TelescopePrompt"
        ];
      };
    };
  };
}
