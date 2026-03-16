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
        "<leader>lr" = {
          action = "rename";
          desc = "Rename the symbol under the cursor";
        };
        "<leader>ld" = {
          action = "definition";
          desc = "Go to the definition of the symbol under the cursor";
        };
        "<leader>li" = {
          action = "implementation";
          desc = "Go to the implementation of the symbol under the cursor";
        };
        "<leader>ls" = {
          action = "signature_help";
          desc = "Show signature help for the symbol under the cursor";
        };
        "<leader>lh" = {
          action = "hover";
          desc = "Show hover information for the symbol under the cursor";
        };
        "<leader>ca" = {
          action = "code_action";
          desc = "Show code actions for the current buffer";
        };
      };
    };
  };

  keymaps = [
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<C-n>";
      mode = "n";
    }
  ];
}
