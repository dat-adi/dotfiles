require('mason-lspconfig').setup({
    ensure_installed = {
        'rust_analyzer',
        'eslint',
        'lua_ls'
    }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
  -- LSP Buffer Keybinds are set here
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)

  -- LSP Diagnostic Keybinds are set here
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
end

local lspconfig = require('lspconfig')
local util = require "lspconfig/util"

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})

-- Go configuration
lspconfig.gopls.setup {
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
}
