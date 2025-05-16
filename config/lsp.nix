{
  plugins = {
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
  };
}
