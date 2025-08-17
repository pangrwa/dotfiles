-- line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true         -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
vim.opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2    -- 2 spaces for indent width
vim.opt.expandtab = true  -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
vim.opt.wrap = false -- disable line wrapping

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
vim.opt.cursorline = true

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- Use the '+' clipboard register (shares with OS)

-- swap files
vim.opt.swapfile = false

-- windows
vim.opt.splitright = true -- vertical split right
vim.opt.splitbelow = true -- horizontal split bottom

-- auto update
vim.opt.autoread = true

-- Automatically check for changes when entering buffer or focusing Neovim
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "CursorHold", "VimResume" }, {
  pattern = "*",
  command = "checktime",
})
