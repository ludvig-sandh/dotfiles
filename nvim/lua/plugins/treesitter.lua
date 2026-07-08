return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    ensure_installed = {
      "python",
      "lua",
      "vim",
      "vimdoc",
      "query",
    },
    highlight = {
      enable = true,
    },
  },
}
