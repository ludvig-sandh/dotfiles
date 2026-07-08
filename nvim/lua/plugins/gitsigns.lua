return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gs = require("gitsigns")

      gs.setup({
        numhl = true,
        word_diff = true,
      })

      -- Navigation
      vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next Git hunk" })
      vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Previous Git hunk" })

      -- Actions
      vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Git hunk" })
      vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Git hunk" })
      vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Git hunk" })

      -- Blame
      vim.keymap.set("n", "<leader>hb", gs.blame_line, { desc = "Blame current line" })

      -- Diff
      vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Git diff" })
    end,
  },
}
