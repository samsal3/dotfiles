vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.expandtab = true
vim.o.laststatus = 0


vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" }
})

vim.cmd("colorscheme gruvbox")


vim.g.snacks_animate = false
