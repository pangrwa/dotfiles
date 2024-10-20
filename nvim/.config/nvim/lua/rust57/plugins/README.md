# This file contains an explaination of what these plugins do

- `colorscheme.lua`: contains configurations for my colour theme
- `nvim-tree.lua`: contains configurations for my file explorer, here are just some important commands
  - `g?`: show the mappings on while toggled on the file explorer
  - `Ctr-k`: show the info of the file/directory
  - `Ctr-t`: open the file in a new table
  - `a`: create file/directory
  - `r`: rename
  - `y`: copy name, `Y`: copy relative path
- `which-key.lua`: contains the configuration to see which keymaps can be used
  - For every new plugin you enter that requires your own custom `<leader>` keymap binding, remember to apply a
    group name under `spec` in the configuration file
- `telescope.lua`: configuration for the fuzzy finder that supports grep and lsp references
  - probably have to look into `ripgrep` more
  - Within the telescope GUI, press `<Ctr-?>` to find more shortcuts to navigate through the search list
  - `Ctr-q`: send selected items by `Tab` to quickfix list
  - checkout LSP support for telescope
- `alpha.lua`: configuration for the start page...
- `bufferline.lua`: configuratio for the buffer line (tabs!)
  - not sure whether is possible to use `bufferline-number` to make tab navigation easier
- `lualine.lua`: configuration for the statusline
  - couple of interesting configurations you could add from understanding lualine customised sections
- `vim-maximizer.lua`: maximise the current buffer (from the statusline, either most left or right you can see if the current buffer is maximised)
- `treesitter.lua`: configuration for basic functionality and especially highlighting
  - `:TSInstall <language_to_install>`: to install the language for syntax highlighting
  - `:InspectTree`: To review the abstract syntax tree
  - explore more about `TexObjects`
- `indent-blankline.lua`: configuration for the indentation guiding line
- `nvim-cmp.lua`: configuration for auto-completion
  - Relies on `luasnippets` to build your own custom snippets
  - I use `friendlysnipplets` to bring preconfigured custom snippets
  - `lspkind`: vs-code like pictograms for the snippets
- `autopairs.lua`: configuration suport multiple characters
- `comments.lua`: configuration to support comments
  - A couple of interesting shortcuts that start with `g(b/c)` in different modes, really makes commenting easier
- `mason.lua`: manages the language server for the language that I work with
  - `:h mason-commands`: view the available commands for you to install the relevant LSP packages
- `lspconfig.lua`
  - add additional kepmaps for telescope to support lsp references
  - `gR`: show LSP references
  - `gD`: go to declaration
  - `K`: show the documentation under cursor (interacts with the LSP)
  - `<leader>rn`: smart rename (for refactoring?)
- `trouble.nvim`: configuration for error tooling (`<leader>x*`)
- `formatting.nvim`: configuratio for formatter
- `linting.lua`: configuration for my linter
- `lazygit.lua`: lazygit GUI

# Possible future extensions that I came across that seems kinda cool

- `auto-session.nvim`
- `dressing.nvim`: just for better UI
- `substitute.nvim`
- `nvim-surround.nvim`: surrounding pairs of bracket
- `gitsigns.nvim`

# general tips

- `ctr-6`: toggle between current file and the last opened file
