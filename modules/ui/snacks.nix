{lib, ...}: {
  plugins.snacks = {
    enable = true;
    settings = {
      indent.enabled = true;
      input.enabled = true;
      notifier.enabled = true;
      scope.enabled = true;
      scroll.enabled = true;
      statuscolumn.enabled = false;
      words.enabled = true;
      dashboard = {
        enabled = true;
        preset = {
          header = ''
             ██████╗ █████╗ ██╗   ██╗██╗    ██╗   ██╗██╗███╗   ███╗
            ██╔════╝██╔══██╗██║   ██║██║    ██║   ██║██║████╗ ████║
            ██║     ███████║██║   ██║██║    ██║   ██║██║██╔████╔██║
            ██║     ██╔══██║██║   ██║██║    ╚██╗ ██╔╝██║██║╚██╔╝██║
            ╚██████╗██║  ██║╚██████╔╝██║     ╚████╔╝ ██║██║ ╚═╝ ██║
             ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝      ╚═══╝  ╚═╝╚═╝     ╚═╝
          '';
        };
        sections = [
          {
            section = "header";
            hl = "Constant";
          }
          { section = "padding"; height = 2; }
          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
          { section = "padding"; height = 2; }
          {
            section = "text";
            text = "\"Lieber im Stuhl einschlafen, als im Schlaf einstuhlen\" - Schristof, 2024";
            hl = "Comment";
          }
        ];
        preset.keys = [
          {
            icon = " ";
            key = "n";
            desc = "New file";
            action = "<CMD>ene | startinsert<CR>";
          }
          {
            icon = " ";
            key = "f";
            desc = "Find file";
            action = ":lua require('telescope.builtin').find_files({hidden = true})";
          }
          {
            icon = "⟳ ";
            key = "r";
            desc = "Recent files";
            action = ":Telescope oldfiles";
          }
          {
            icon = " ";
            key = "q";
            desc = "Quit Neovim";
            action = ":qa";
          }
        ];
      };
    };
  };

  keymaps = [
    {
      key = "<leader>gg";
      action = lib.nixvim.mkRaw ''
        function()
          Snacks.terminal({"lazygit"})
        end
      '';
    }
    {
      key = "<leader>tf";
      action = lib.nixvim.mkRaw ''
        function()
          Snacks.terminal({"fish"})
        end
      '';
    }
  ];
}
