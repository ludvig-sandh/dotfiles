vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.ignorecase = true -- search is case-insensitive by default
vim.opt.smartcase = true -- case-sensitive only if I type a capital
vim.opt.undofile = true -- persistent undo across sessions
vim.opt.scrolloff = 24 -- keep cursor away from the screen edge
vim.opt.clipboard = 'unnamedplus' -- shared the system clipboard

vim.g.python3_host_prog = vim.fn.expand("~/.venvs/neovim/bin/python")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require('keys')

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setloclist)
