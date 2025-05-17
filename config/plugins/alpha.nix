{
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
  };
}
