{
  plugins = {
    ltex-extra.enable = true;
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
        ["en-US"] = { vim.fn.stdpath("data") .. "/spell/en.utf-8.add" },
        ["de-DE"] = { vim.fn.stdpath("data") .. "/spell/de.utf-8.add" },
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

    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end;
  '';
}
