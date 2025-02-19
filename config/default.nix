{
  # Import all your configuration modules here
  imports = [./bufferline.nix];

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
      settings.suggestion = {enabled = false;};
      settings.panel = {enabled = false;};
    };
    lsp = {
      enable = true;
      servers = {
        # C/C++
        clangd.enable = true;
        # C#
        csharp_ls.enable = true;
        # Haskell
        hls.enable = true;
        hls.installGhc = true;
        # Java
        java_language_server.enable = true;
        # Nix
        nixd.enable = true;
        # Python
        pylsp.enable = true;
        # Rust
        rust_analyzer.enable = true;
        rust_analyzer.installCargo = true;
        rust_analyzer.installRustc = true;
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
