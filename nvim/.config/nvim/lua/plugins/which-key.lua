return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    --
    spec = {
      {
        "<leader>w",
        group = "window management"
      },
      {
        "<leader>t",
        group = "tabs management"
      },
      {
        "<leader>n",
        group = "misc."
      },
      {
        "<leader>f",
        group = "telescope"
      },
      {
        "<leader>e",
        group = "neotree"
      },
      {
        "<leader>l",
        group = "lsp"
      },
      {
        "<leader>x",
        group = "trouble"
      },
      {
        "<leader>d",
        group = "dap"
      },
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
