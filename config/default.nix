{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  colorschemes.tokyonight = {
      enable = true;
      settings.style = "night";
      settings.transparent = true;
  };

  plugins = {
    alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 4;
        }
        {
          opts = {
            hl = "Constant";
            position = "center";
          };
          type = "text";
          val = [
            " ██████╗ █████╗ ██╗   ██╗██╗    ██╗   ██╗██╗███╗   ███╗"
            "██╔════╝██╔══██╗██║   ██║██║    ██║   ██║██║████╗ ████║"
            "██║     ███████║██║   ██║██║    ██║   ██║██║██╔████╔██║"
            "██║     ██╔══██║██║   ██║██║    ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "╚██████╗██║  ██║╚██████╔╝██║     ╚████╔╝ ██║██║ ╚═╝ ██║"
            " ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝      ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
        }
        {
          type = "padding";
          val = 4;
        }
        {
          type = "group";
          val = let
            mkButton = shortcut: cmd: val: hl: {
              type = "button";
              inherit val;
              opts = {
                inherit hl shortcut;
                keymap = [
                  "n"
                  shortcut
                  cmd
                  {}
                ];
                position = "center";
                cursor = 0;
                width = 40;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            };
          in [
            (
              mkButton
              "n"
              "<CMD>ene <BAR> startinsert <CR>"
              " > New file"
              "Operator"
            )
            (
              mkButton
              "f"
              "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>"
              " > Find file"
              "Operator"
            )
            (
              mkButton
              "r"
              "<CMD>Telescope oldfiles<CR>"
              "⟳ > Recent files"
              "Operator"
            )
            (
              mkButton
              "q"
              "<CMD>qa<CR>"
              " > Quit Neovim"
              "String"
            )
          ];
        }
        {
          type = "padding";
          val = 4;
        }
        {
          opts = {
            hl = "AlphaHeader";
            position = "center";
          };
          type = "text";
          val = "\"Lieber im Stuhl einschlafen, als im Schlaf einstuhlen\" - Schristof, 2024";
        }
      ];
    };

    copilot-cmp.enable = true;
    copilot-lua = {
      enable = true;
      suggestion = {enabled = false;};
      panel = {enabled = false;};
    };
    lsp = {
      enable = true;
      servers = {
        # C/C++
        clangd.enable = true;
        # C#
        csharp-ls.enable = true;
        # Java
        java-language-server.enable = true;
        # Python
        pylsp.enable = true;
        # Rust
        rust-analyzer.enable = true;
        rust-analyzer.installCargo = true;
        rust-analyzer.installRustc = true;
      };
    };
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
          "<Tab>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
					"<S-Tab>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
					"<C-b>" = "cmp.mapping.scroll_docs(-4)";
					"<C-f>" = "cmp.mapping.scroll_docs(4)";
					"<C-Space>" = "cmp.mapping.complete()";
					"<C-e>" = "cmp.mapping.abort()";
					# Accept current item, do not replace text
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
    which-key.enable = true;
  };

  extraConfigLua = ''
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  '';
}
