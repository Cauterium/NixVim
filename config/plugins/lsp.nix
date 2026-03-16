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
        # LaTeX
        ltex.enable = true;
        # Nix
        nixd.enable = true;
        # Python
        pylsp.enable = true;
        # Rust
        rust_analyzer.enable = true;
        rust_analyzer.installCargo = true;
        rust_analyzer.installRustc = true;
        rust_analyzer.installRustfmt = true;
      };
    };
  };

  extraConfigLua = ''
    local languages = {
      dictionaries = {
        ["en-US"] = { vim.fn.stdpath("data") .. "/spell/en.txt" },
        ["de-DE"] = { vim.fn.stdpath("data") .. "/spell/de.txt" },
      }
    }

    function languages.readDictFiles(lang)
      local files = languages.dictionaries[lang]
      local dict = {}
      if files then
        for _, file in ipairs(files) do
          local f = io.open(file, "r")
          if f then
            for l in f:lines() do
              -- Trim whitespace/newlines
              local word = l:gsub("%s+", "")
              if word ~= "" then table.insert(dict, word) end
            end
            f:close()
          end
        end
      end
      return dict
    end

    -- Use the new 0.11 native config API
    -- This replaces the old require('lspconfig').ltex.setup({...})
    vim.lsp.config["ltex"] = {
      settings = {
        ltex = {
          language = "en-US",
          dictionary = {
            ["en-US"] = languages.readDictFiles("en-US"),
            ["de-DE"] = languages.readDictFiles("de-DE"),
          },
          additionalRules = {
            enablePickyRules = true,
          },
          completionEnabled = true,
        },
      },
    }
  '';
}
