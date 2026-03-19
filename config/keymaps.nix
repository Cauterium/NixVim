{
  plugins = {
    telescope.keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";
    };

    blink-cmp.settings.keymap = {
      "<Tab>" = [ "select_next" "fallback" ];
      "<S-Tab>" = [ "select_prev" "fallback" ];
      "<C-j>" = [ "snippet_forward" "fallback" ];
      "<C-k>" = [ "snippet_backward" "fallback" ];
      "<C-e>" = [ "cancel" ];
      "<C-CR>" = [ "select_and_accept" ];
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
