return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "mason.nvim",
  },
  config = function(_, opts)
    local keymap = vim.keymap
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- for Java
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function(args)
        require 'plugins.lsp.jdtls.jdtls_setup'.setup()
      end
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader><c-r>", ":LspRestart<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "<leader>lgd", vim.lsp.buf.declaration, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "<leader>ll", vim.lsp.buf.hover, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>lR", vim.lsp.buf.rename, opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        -- Server-specific keybinds
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.name == "clangd" then
          opts.desc = "Switch between header and source"
          keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
        end
      end,
    })

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    -- In Neovim 0.11+, we can use vim.lsp.config to define servers.
    -- nvim-lspconfig still provides the configs (cmd, filetypes, root_dir) 
    -- but we should avoid require('lspconfig') if possible to avoid the warning.
    
    -- Helper to get lspconfig defaults without triggering the warning (accessing the configs table directly)
    local configs = require('lspconfig.configs')

    local function setup_server(name, custom_config)
      local config = configs[name] and vim.deepcopy(configs[name].default_config) or {}
      config.capabilities = capabilities
      if custom_config then
        config = vim.tbl_deep_extend("force", config, custom_config)
      end
      vim.lsp.config(name, config)
      vim.lsp.enable(name)
    end

    setup_server('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    setup_server('clangd', {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
    })

    setup_server('ocamllsp')
    setup_server('ts_ls')
    setup_server('pyright')
    setup_server('rust_analyzer')
  end
}
