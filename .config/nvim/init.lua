vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.expandtab = true
vim.o.laststatus = 0

vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("gruvbox").setup({
        undercurl = false,
        underline = false,
        bold = true,
        italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
        },
        strikethrough = false,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true, 
        contrast = "hard", 
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

require("nvim-treesitter").install({
        "c",
        "cpp",
        "lua"
})
vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
                pcall(vim.treesitter.start, args.buf)
        end,
})
