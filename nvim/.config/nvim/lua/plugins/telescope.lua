return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = {
      defaults = {
        wrap_results = true,
        sorting_strategy = "ascending",
      },
      pickers = {
        oldfiles = {
          initial_mode = "normal",
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },
}
