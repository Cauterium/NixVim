{
  plugins = {
    copilot-lua.enable = true;
    copilot-lua.settings = {
      copilot = {
        panel = {enabled = false;};
        suggestion = {enabled = false;};
      };
    };
    luasnip.enable = true;
    friendly-snippets.enable = true;
    colorful-menu.enable = true;

    blink-copilot.enable = true;
    blink-cmp-latex.enable = true;
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        completion = {
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 100;
            window.border = "rounded";
          };
          ghost_text.enabled = true;
          list.selection = {
            auto_insert = false;
            preselect = true;
          };
          menu = {
            draw.__raw = ''
              {
                columns = { { "kind_icon" }, { "label", gap = 1 } },
                components = {
                  label = {
                    text = function(ctx)
                      return require("colorful-menu").blink_components_text(ctx)
                    end,
                    highlight = function(ctx)
                      return require("colorful-menu").blink_components_highlight(ctx)
                    end,
                  },
                },
              }
            '';
          };
          trigger = {
            show_in_snippet = true;
            show_on_keyword = true;
            show_on_trigger_character = true;
            show_on_accept_on_trigger_character = true;
            show_on_insert_on_trigger_character = true;
          };
        };

        signature = {
          enabled = true;
          window.border = "rounded";
        };

        snippets.preset = "luasnip";

        sources = {
          default = [
            "buffer"
            "lsp"
            "path"
            "copilot"
            "latex-symbols"
            "snippets"
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
