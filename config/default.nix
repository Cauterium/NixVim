{
  # Import all your configuration modules here
  imports = [
    ./settings.nix

    ./plugins/alpha.nix
    ./plugins/cmp.nix
    ./plugins/editor.nix
    ./plugins/lsp.nix
    ./plugins/telescope.nix
  ];

  colorschemes.tokyonight = {
    enable = true;
    settings.style = "night";
    settings.transparent = true;
  };

  plugins = {
    bufferline.enable = true;
    commentary.enable = true;
    lint.enable = true;
    noice.enable = true;
    notify.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
  };
}
