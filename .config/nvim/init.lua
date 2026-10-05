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

vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
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
                "saghen/blink.cmp",
                version = "1.*", 
                opts = {
                        keymap = { preset = "enter" },
                        completion = {
                                documentation = { auto_show = true, auto_show_delay_ms = 200 },
                        },
                        signature = { enabled = true }, -- function parameter hints
                        sources = { default = { "lsp", "path", "snippets", "buffer" } },
                },
        },
}, { ui = { border = "rounded" } })

vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("clangd", {
        cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=never",
                "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" },
})

vim.lsp.enable("clangd")

vim.diagnostic.config({
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = true },
        virtual_text = true, -- shows messages inline next to the error
})

local map = vim.keymap.set

map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

local function switch_source_header()
        local bufnr = vim.api.nvim_get_current_buf()
        local client = vim.lsp.get_clients({ bufnr = bufnr, name = "clangd" })[1]
        if not client then return end
        local params = vim.lsp.util.make_text_document_params(bufnr)
        client:request("textDocument/switchSourceHeader", params, function(_, result)
                if result then vim.cmd.edit(vim.uri_to_fname(result)) end
        end, bufnr)
end

vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
                local function lmap(keys, fn, desc)
                        map("n", keys, fn, { buffer = ev.buf, desc = desc })
                end
                lmap("gd", vim.lsp.buf.definition, "Go to definition")
                lmap("gD", vim.lsp.buf.declaration, "Go to declaration")
                lmap("gi", vim.lsp.buf.implementation, "Go to implementation")
                lmap("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
                lmap("<leader>h", switch_source_header, "Switch source/header")
        end,
})

