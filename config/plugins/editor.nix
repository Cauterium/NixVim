{
  plugins = {
    illuminate.enable = true;
    indent-blankline.enable = true;
    lualine.enable = true;
    neo-tree.enable = true;
    nvim-autopairs.enable = true;
    todo-comments.enable = true;
    treesitter.enable = true;

    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add.text = " ";
          change.text = " ";
          delete.text = " ";
          untracked.text = "";
          topdelete.text = "󱂥 ";
          changedelete.text = "󱂧 ";
        };

        current_line_blame = true;
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
        };
        signcolumn = true;
      };
    };

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
