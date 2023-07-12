
if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim

    local telescope = require('telescope')
    telescope.setup {
	    defaults = {
		    vimgrep_arguments = {
			    'rg',
			    '--color=never',
			    '--no-heading',
			    '--with-filename',
			    '--line-number',
			    '--column',
			    '--smart-case',
			    '--hidden',
		    }
	    },
            pickers = {
        	    find_files = {
        		    hidden = true
        	    },
        	    git_files = {
        		    hidden = true
        	    }
            }
    }
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', function()
	    builtin.grep_string({ search = vim.fn.input("Grep > "), hidden = true})
    end)
end
