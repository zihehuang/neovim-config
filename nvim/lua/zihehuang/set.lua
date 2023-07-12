vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 16
vim.opt.signcolumn = "yes"
vim.opt.isfname:append({"@-@"})

vim.opt.updatetime = 100
vim.opt.colorcolumn = "80"

vim.opt.foldmethod = "manual"
