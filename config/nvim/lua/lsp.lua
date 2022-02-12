local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local opts = {
    tools = { -- rust-tools options
      autoSetHints = true,
      hover_with_actions = true,
      inlay_hints = {
        show_parameter_hints = false,
        parameter_hints_prefix = "",
        other_hints_prefix = "",
      },
    },
    server = {
      -- on_attach is a callback called when the language server attaches to the buffer
      -- on_attach = on_attach,
      settings = {
        -- to enable rust-analyzer settings visit:
        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ["rust-analyzer"] = {
          -- enable clippy on save
          checkOnSave = {
            command = "clippy"
          },
        }
      }
    },
  }

  if server.name == "rust_analyzer" then
    -- Initialize the LSP via rust-tools instead
    require("rust-tools").setup {
      -- The "server" property provided in rust-tools setup function are the
      -- settings rust-tools will provide to lspconfig during init.
      -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
      -- with the user's own settings (opts).
      server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
    }
    server:attach_buffers()
  else
    server:setup(opts)
  end
end)
