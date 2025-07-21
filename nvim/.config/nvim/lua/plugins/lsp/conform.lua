return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      python = { "isort", "black" },
      lua = { "stylua " },
      cpp = { "clang-format" },
      markdown = { "markdownlint-cli2" },
      ["markdown.mdx"] = { "markdownlint-cli2" },
    },
    formatters = {
      clang_format = {
        command = "clang-format",
        args = { "--style=file", '--fallback-style=LLVM' }
      }
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    }
  },
  config = function(_, opts)
    require("conform").setup(opts);

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
