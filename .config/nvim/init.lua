vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.expandtab = true
vim.o.laststatus = 0
vim.o.guicursor = ""

vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
        { src = "https://github.com/ibhagwan/fzf-lua" },
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

local fzf = require("fzf-lua")
fzf.setup({
        winopts = {
                height = 0.40,
                width  = 1.00,
                row    = 1.00,
                col    = 0.00,
                preview = {
                        layout     = "horizontal",
                        horizontal = "right:50%",
                },
        },
})

-- files
vim.keymap.set("n", "<leader>f", fzf.files,         { desc = "Find files in project" })
vim.keymap.set("n", "<leader>b", fzf.buffers,       { desc = "Open buffers" })

-- keyword search (ripgrep)
vim.keymap.set("n", "<leader>g", fzf.live_grep,     { desc = "Live grep project" })
vim.keymap.set("n", "<leader>w", fzf.grep_cword,    { desc = "Grep word under cursor" })
vim.keymap.set("v", "<leader>g", fzf.grep_visual,   { desc = "Grep selection" })

-- tags (ctags)
vim.keymap.set("n", "<leader>t", fzf.tags,          { desc = "Project tags" })
vim.keymap.set("n", "<leader>T", fzf.btags,         { desc = "Tags in current buffer" })
vim.keymap.set("n", "<leader>]", fzf.tags_grep_cword, { desc = "Tags matching word under cursor" })

-- misc
vim.keymap.set("n", "<leader>r", fzf.resume,        { desc = "Resume last picker" })
