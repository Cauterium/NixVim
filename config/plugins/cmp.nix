{
  plugins = {
    copilot-lua.enable = true;
    copilot-lua.settings = {
      copilot = {
        panel = {enabled = false;};
        suggestion = {enabled = false;};
      };
    };
    copilot-cmp.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          {name = "copilot";}
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
        mapping = {
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
  };

  extraConfigLua = ''
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  '';
}
