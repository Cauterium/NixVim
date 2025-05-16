{
  # Import all your configuration modules here
  imports = [
    ./alpha.nix
    ./bufferline.nix
    ./lsp.nix
  ];

  colorschemes.tokyonight = {
    enable = true;
    settings.style = "night";
    settings.transparent = true;
  };

  opts = {
    number = true;
    expandtab = true;
    shiftwidth = 2;
  };

  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
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
    lazy.enable = true;
    lint.enable = true;
    lualine.enable = true;
    neo-tree.enable = true;
    noice.enable = true;
    notify.enable = true;
    telescope.enable = true;
    treesitter.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
  };

  extraConfigLua = ''
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  '';
}
