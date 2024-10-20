return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    preset = "modern",
    -- group naming for custom leader kep mappings in respective plugin file
    spec = {
      {
        "<leader>f", group = "telescope",
      },
      {
        "<leader>e", group = "nvim-tree",
      },
      {
        "<leader>s", group = "window management",
      },
      {
        "<leader>t", group = "tab management",
      },
      {
        "<leader>x", group = "trouble",
      },
      {
        "<leader>g", group = "treesitter-selection",
      },
      {
        "<leader>gi", desc = "Increment node with nvim-treesitter"
      },
      {
        "<leader>gs", desc = "Increment scope with nvim-treesitter"
      },
      {
        "<leader>gd", desc = "Decrement scope with nvim-treesitter"
      },
    }
  },
}

