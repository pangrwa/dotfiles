return {
  'akinsho/bufferline.nvim',
  event = "VeryLazy",
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      always_show_bufferline = false,
      mode = "tabs",
      diagnostics = "nvim_lsp",
      numbers = "ordinal",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        }
      },
    }
  },
}
