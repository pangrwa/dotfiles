return {
  'echasnovski/mini.pairs',
  event = "VeryLazy",
  version = '*',
  opts = {
    modes = { insert = true, command = false, terminal = false },
    -- skip autopair when next character is one of these
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    -- skip autopair when the cursor is inside these treesitter nodes
    skip_ts = { "string" },
    -- skip autopair when next character is closing pair
    -- and there are more closing pairs than opening pairs
    skip_unbalanced = true,
    -- better deal with markdown code blocks
    markdown = true,
  },
  config = function(_, opts)
    require("mini.pairs").setup(opts)

    -- for ocaml generic type notations
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ocaml",
      callback = function(args)
        local pairs = require('mini.pairs')
        pairs.unmap("i", "'", "''")
      end
    })
  end
}
