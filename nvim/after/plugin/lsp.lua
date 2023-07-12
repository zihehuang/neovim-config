local lsp = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

-- Fix Undefined global 'vim'
lsp.configure('lua-ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
    -- ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.abort(),

    -- disable completion with tab
    ['<Tab>'] = vim.NIL,
    ['<S-Tab>'] = vim.NIL,

    -- disable confirm with Enter key
    -- ['<CR>'] = vim.NIL,
  })
})

vim.diagnostic.config({
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})


-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Configure width of error window
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   opts.border = opts.border or 'single'
--   opts.max_width= opts.max_width or 100
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

