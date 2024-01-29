vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.opt.mouse = 'a' 
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true

vim.cmd("set number relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- FOR WSL: Linux install wl-clipboard to copy paste from Windows to Linux
vim.keymap.set({'n', 'x'}, 'gy', '"+y')
vim.keymap.set({'n', 'x'}, 'gp', '"+p')

-- Enabling this does not overwrite the register with deleted text.
-- vim.keymap.set({'n', 'x'}, 'x', '"_x')
-- vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- select all text in current buffer.
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

