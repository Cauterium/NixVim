{config, pkgs, ...}:
let
  treesitter-ipynb = pkgs.tree-sitter.buildGrammar {
    language = "ipynb";
    version = "0.0.0";

    src = pkgs.fetchFromGitHub {
      owner = "ajbucci";
      repo = "ipynb.nvim";
      rev = "9ec5b566dc37417b17d7e9de04d673506176e9fd";
      hash = "sha256-iwvN829U/V5/YLqIY+KgVIYVK3Tg9HtP+v82VhPWmmM=";
    };

    sourceRoot = "source/tree-sitter-ipynb";

    meta.homepage = "https://github.com/ajbucci/ipynb.nvim";
  };
in {
  plugins = {
    bufferline.enable = true;
    colorizer.enable = true;
    commentary.enable = true;
    illuminate.enable = true;
    indent-blankline.enable = true;
    lint.enable = true;
    lualine.enable = true;
    neo-tree.enable = true;
    noice.enable = true;
    notify.enable = true;
    nvim-autopairs.enable = true;
    snacks.enable = true;
    todo-comments.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;

    treesitter = {
      enable = true;
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        bash
        bibtex
        c
        c_sharp
        cmake
        comment
        cpp
        diff
        git_config
        git_rebase
        gitattributes
        gitcommit
        gitignore
        haskell
        haskell_persistent
        html
        hyprlang
        java
        javadoc
        javascript
        json
        json5
        latex
        make
        markdown
        nix
        python
        rust
        treesitter-ipynb
        vim
        vimdoc
        yaml
      ];
    };

    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add.text = " ";
          change.text = " ";
          delete.text = " ";
          untracked.text = "";
          topdelete.text = "󱂥 ";
          changedelete.text = "󱂧 ";
        };

        current_line_blame = true;
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
        };
        signcolumn = true;
      };
    };

    trim = {
      enable = true;
      settings = {
        highlight = true;
        ft_blocklist = [
          "checkhealth"
          "lspinfo"
          "neo-tree"
          "TelescopePrompt"
        ];
      };
    };
  };

  extraPlugins = [
    pkgs.vimPlugins.ipynb-nvim
  ];

  extraPackages = with pkgs.python3Packages; [
    jupyter
    jupyter-client
  ];

  extraConfigLua = ''
    require("ipynb").setup()
  '';
}
