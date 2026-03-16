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
