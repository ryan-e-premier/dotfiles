return {
  "stevearc/oil.nvim",
  --@module 'oil'
  --@type oil.SetupOpts
  opts = {
    columns = {
      "icon",
      --  "permissions",
    },
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      mode = { "n" },
      desc = "Open parent dir",
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
}
