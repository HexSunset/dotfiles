-- Plugin installation
require('packer').startup(function()

    use 'wbthomason/packer.nvim'

    use 'preservim/nerdtree'

    use 'andweeb/presence.nvim'
    
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

    use {
        "catppuccin/nvim",
        as = "catppuccin",
    }

    use 'psliwka/vim-smoothie'

    use 'lukas-reineke/indent-blankline.nvim'

    use {'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

    use 'preservim/nerdcommenter'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use { 'lewis6991/gitsigns.nvim', 
        tag = 'release',
        config = function()
            require('gitsigns').setup()
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
    }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'


end)

---------------
-- LSPCONFIG --
---------------

local nvim_lsp = require'lspconfig'

nvim_lsp.pyright.setup{}

nvim_lsp.clangd.setup{}

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy",
                },
            }
        }
    },
    dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
}

require('rust-tools').setup(opts)

require('lspconfig')['rust_analyzer'].setup{}

----------------------
-- INDENT-BLANKLINE --
----------------------

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}


----------------
-- BUFFERLINE --
----------------

require("bufferline").setup()

----------------
-- CATPPUCCIN --
----------------

local options = {
    term_colors = true
}

require("catppuccin").setup()

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]

----------------
-- TREESITTER --
----------------

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "python", "fish", "bash" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },

  indent = {
      enable = true,
  },
}

-------------
-- LUALINE --
-------------

local opts = {
    theme = 'codedark'
}

require('lualine').setup(opts)

-------------------
-- RICH PRESENCE --
-------------------

require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "New Vi IMproved", -- Text displayed when hovered over the Neovim image
    main_image          = "file",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = false,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
