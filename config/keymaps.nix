{
  plugins = {
    telescope.keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";
    };

    cmp.settings.mapping = {
      "<Tab>" = "cmp.mapping.select_next_item()";
      "<S-Tab>" = "cmp.mapping.select_prev_item()";
      "<C-e>" = "cmp.mapping.abort()";
      "<C-CR>" = "cmp.mapping.confirm({ select = true })";
    };

    lsp.keymaps = {
      lspBuf = {
        "<leader>lf" = {
          action = "format";
          desc = "Format the current buffer";
        };
        "<leader>ca" = {
          action = "code_action";
          desc = "Show code actions for the current buffer";
        };
      };
    };
  };
}
