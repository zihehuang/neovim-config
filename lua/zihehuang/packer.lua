-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local vscode = vim.g.vscode == 1

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.x', disable = vscode,
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
          'rose-pine/neovim',
          as = 'rose-pine',
          config = function()
        	  require("rose-pine").setup()
        	  vim.cmd('colorscheme rose-pine')
          end
  })

  use { 'nvim-treesitter/nvim-treesitter', disable = vscode }
  use { 'nvim-treesitter/nvim-treesitter-context', disable = vscode }

  use { 'tpope/vim-fugitive', disable = vscode }

  use {
	  'VonHeikemen/lsp-zero.nvim', disable = vscode,
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }
  use {
	  'ruifm/gitlinker.nvim',
	  requires = 'nvim-lua/plenary.nvim',
  }

  use { "zbirenbaum/copilot.lua" }

  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui" }
  use { "leoluz/nvim-dap-go" }
end)
