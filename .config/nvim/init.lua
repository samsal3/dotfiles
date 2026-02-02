-- Bootstrap lazy.nvim
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
   if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
         { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
         { out, "WarningMsg" },
         { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
   end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.laststatus = 0

require("lazy").setup({
	{
		"catppuccin/nvim", 
		name = "catppuccin", 
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				color_overrides = {
					mocha = {
						base = "#000000",
						mantle = "#000000",
						crust = "#000000",
					},
				},
			})
			vim.cmd.colorscheme "catppuccin"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "c", "lua", "vimdoc" },
				callback = function() vim.treesitter.start() end,
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
         vim.lsp.enable('clangd')
		end,
	}
})

