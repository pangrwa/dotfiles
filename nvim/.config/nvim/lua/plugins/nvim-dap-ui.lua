return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "nvim-neotest/nvim-nio" },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
  },
  opts = {},
  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")


    dapui.setup(opts)
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end

    -- chatgpt help me create - but only when I open up my repl it seems to work, the default repl that is created when i toggle the UI doesn't seem to work
    -- Auto-scroll REPL window to the bottom on write
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*dap-repl*",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local win = vim.fn.bufwinid(bufnr)
        if win ~= -1 then
          vim.api.nvim_win_call(win, function()
            vim.cmd("normal! G") -- scroll to bottom
          end)
        end
      end,
    })
  end,
}
