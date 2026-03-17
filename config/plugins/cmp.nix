{
  plugins = {
    copilot-lua.enable = true;
    copilot-lua.settings = {
      copilot = {
        panel = {enabled = false;};
        suggestion = {enabled = false;};
      };
    };

    blink-copilot.enable = true;
    blink-cmp-latex.enable = true;
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        signature.enabled = true;
        sources = {
          default = [
            "buffer"
            "lsp"
            "path"
            "copilot"
            "latex-symbols"
          ];
          providers = {
            copilot = {
              name = "copilot";
              module = "blink-copilot";
              async = true;
              score_offset = 100;
            };
            lsp.score_offset = 4;
            latex-symbols = {
              name = "LaTeX";
              module = "blink-cmp-latex";
              async = true;
            };
          };
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
