vim.g.mapleader = " "

-- clear highlight
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })



-- window management
-- https://neovim.io/doc/user/windows.html#_3.-opening-and-closing-a-window
vim.keymap.set("n", "<leader>wv", "<c-w>v", { desc = "split windows vertically" })
vim.keymap.set("n", "<leader>wh", "<c-w>s", { desc = "split windows horizontally" })
vim.keymap.set("n", "<leader>we", "<c-w>=", { desc = "splits equal size" })
vim.keymap.set("n", "<leader>wx", "<c-w>q", { desc = "closes the current window" })


-- window navigation (These overrides some of the keybindings in the normal mode but I deem it uncessary)
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "move to the window on the left of the current window" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "move to the window on the bottom of the current window" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "move to the window on the top of the current window" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "move to the window on the right of the current window" })

-- window movements
--vim.keymap.set("n", "<c-s-l>", "<c-w><c-r>", { desc = "rotate window downwards/rightwards" })
--vim.keymap.set("n", "<c-s-h>", "<c-w>r", { desc = "rotate window upwards/leftwards" })


vim.keymap.set("n", "<leader><c-h>", "<c-w>H", { desc = "move window the the far left" })
vim.keymap.set("n", "<leader><c-j>", "<c-w>J", { desc = "move window the the far bottom" })
vim.keymap.set("n", "<leader><c-k>", "<c-w>K", { desc = "move window the the far top" })
vim.keymap.set("n", "<leader><c-l>", "<c-w>L", { desc = "move window the the far right" })


-- window resizing
vim.keymap.set("n", "<leader>w=", "5<c-w>+", { desc = "increase height" })
vim.keymap.set("n", "<leader>w-", "5<c-w>-", { desc = "decrease height" })
vim.keymap.set("n", "<leader>w.", "5<c-w>>", { desc = "increase width" })
vim.keymap.set("n", "<leader>w,", "5<c-w><", { desc = "decrease width" })


-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })

vim.keymap.set("n", "<leader>t1", "1gt", { desc = "Go to tab 1" })
vim.keymap.set("n", "<leader>t2", "2gt", { desc = "Go to tab 2" })

for i = 1, 9 do
  vim.keymap.set("n", "<leader>t" .. i, i .. "gt", { desc = "Go to tab" .. i })
end
