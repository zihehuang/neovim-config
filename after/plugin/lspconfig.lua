local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- Go specific config
-- Lets you go to definition in files with build tags
lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      buildFlags = {"-tags=integration"},
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- Auto imports and auto format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.format({ async = true })
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

