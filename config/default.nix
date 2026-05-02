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

  colorschemes.catppuccin = {
    enable = true;
    settings.flavour = "mocha";
    settings.transparent_background = true;
  };
}
