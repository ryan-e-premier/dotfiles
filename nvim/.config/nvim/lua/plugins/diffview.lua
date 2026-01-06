return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = {
        layout = "diff2_horizontal",
      },
      merge_tool = {
        layout = "diff3_horizontal",
      },
    },
    keymaps = {
      view = {
        ["<C-j>"] = "<C-d>",
        ["<C-k>"] = "<C-u>",
      },
      file_panel = {
        ["<C-j>"] = "<C-d>",
        ["<C-k>"] = "<C-u>",
      },
      file_history_panel = {
        ["<C-j>"] = "<C-d>",
        ["<C-k>"] = "<C-u>",
      },
    },
  },
}
