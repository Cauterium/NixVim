{
  # Import all your configuration modules here
  imports = [
    ./settings.nix
    ./keymaps.nix

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
    settings.styles.floats = "normal";
  };
}
