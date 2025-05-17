{
  # Import all your configuration modules here
  imports = [
    ./settings.nix

    ./plugins/alpha.nix
    ./plugins/cmp.nix
    ./plugins/editor.nix
    ./plugins/lsp.nix
  ];

  colorschemes.tokyonight = {
    enable = true;
    settings.style = "night";
    settings.transparent = true;
  };

  plugins = {
    bufferline.enable = true;
    commentary.enable = true;
    lazy.enable = true;
    lint.enable = true;
    noice.enable = true;
    notify.enable = true;
    nvim-autopairs.enable = true;
    telescope.enable = true;
    todo-comments.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
  };
}
