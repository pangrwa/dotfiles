return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      sync_install = false,
      auto_install = false,
      ignore_install = {},
      highlight = {
        enable = true,
      },
      modules = {},
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "cpp",
        "python",
        "go",
        "java"
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>gg",
          node_incremental = "<leader>gi",
          scope_incremental = "<leader>gs",
          node_decremental = "<leader>gd",
        },
      },
    })
  end,
}
