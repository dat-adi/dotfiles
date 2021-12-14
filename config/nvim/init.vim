" -----------------------------------------
"        _       _                   _ _
"       | |     | |                 | (_)
"     __| | __ _| |_ ______ __ _  __| |_
"    / _` |/ _` | __|______/ _` |/ _` | |
"   | (_| | (_| | |_      | (_| | (_| | |
"    \__,_|\__,_|\__|      \__,_|\__,_|_|
"
" -----------------------------------------
"
"         Instagram : dat.adithya
"            GitHub : @dat-adi
"
" -----------------------------------------

" --- Plugins --- "
call plug#begin()

    Plug 'ap/vim-css-color'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'glepnir/lspsaga.nvim'

    Plug 'JoosepAlviste/palenightfall.nvim'
    Plug 'ryanoasis/vim-devicons'

    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-emoji'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'glepnir/galaxyline.nvim'
    Plug 'simrat39/rust-tools.nvim'

    Plug 'tpope/vim-fugitive'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'


call plug#end()

" --- Syntax Highlighting --- "
syntax on

" --- Normal VIM Settings --- "
set encoding=utf-8
set ts=4
set noerrorbells
set shiftwidth=4
set expandtab
set smartindent
set rnu
set spell
set nowrap
set smartcase
set noswapfile
set incsearch
set foldmethod=indent
set foldlevel=99

" --- General Settings --- "
let mapleader = ","

" --- Color Settings --- "
" While I had gruvbox set in here a while ago,
" I'm using the palenightfall in lua now.

" --- General Mappings --- "
map <leader>h :noh<CR>

" --- Resize Remaps --- "
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" --- Plugin Mappings --- "
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>

nnoremap <space> za

" --- Lua Remaps --- "
" >> Checks buffers
nnoremap <leader>;      :lua require'telescope.builtin'.buffers{}<CR>

" >> Fzf the current buffer
nnoremap <leader>/      :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" >> Access any file inside the git repo
nnoremap <leader>f      :lua require'telescope.builtin'.git_files(require('telescope.themes').get_ivy({}))<CR>

nnoremap <silent> gd    :Lspsaga preview_definition()<CR>
nnoremap <silent> K     :Lspsaga hover_doc()<CR>

" >> Go to the definition of the word
nnoremap <silent> <C-d>  :lua require'telescope.builtin'.lsp_definitions{}<CR>

" -- LSP Key bindings -- "
nnoremap <silent> =G    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>

lua << EOF
require("treesitter")
require("statusbar")
require("completion")
require("palenightfall").setup()
require("rust-tools.inlay_hints").set_inlay_hints()
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {
        tools = { -- rust-tools options
            -- Automatically set inlay hints (type hints)
            autoSetHints = true,

            -- Whether to show hover actions inside the hover window
            -- This overrides the default hover handler 
            hover_with_actions = true,

            -- how to execute terminal commands
            -- options right now: termopen / quickfix
            executor = require("rust-tools/executors").termopen,

            runnables = {
                -- whether to use telescope for selection menu or not
                use_telescope = true

                -- rest of the opts are forwarded to telescope
            },

            debuggables = {
                -- whether to use telescope for selection menu or not
                use_telescope = true

                -- rest of the opts are forwarded to telescope
            },

            -- These apply to the default RustSetInlayHints command
            inlay_hints = {

                -- Only show inlay hints for the current line
                only_current_line = false,

                -- Event which triggers a refersh of the inlay hints.
                -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
                -- not that this may cause  higher CPU usage.
                -- This option is only respected when only_current_line and
                -- autoSetHints both are true.
                only_current_line_autocmd = "CursorHold",

                -- wheter to show parameter hints with the inlay hints or not
                show_parameter_hints = true,

                -- prefix for parameter hints
                parameter_hints_prefix = "<- ",

                -- prefix for all the other hints (type, chaining)
                other_hints_prefix = "=> ",

                -- whether to align to the length of the longest line in the file
                max_len_align = false,

                -- padding from the left if max_len_align is true
                max_len_align_padding = 1,

                -- whether to align to the extreme right or not
                right_align = false,

                -- padding from the right if right_align is true
                right_align_padding = 7,

                -- The color of the hints
                highlight = "Comment",
            },

            hover_actions = {
                -- the border that is used for the hover window
                -- see vim.api.nvim_open_win()
                border = {
                    {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                    {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                    {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                    {"╰", "FloatBorder"}, {"│", "FloatBorder"}
                },

                -- whether the hover action window gets automatically focused
                auto_focus = false
            },

            -- settings for showing the crate graph based on graphviz and the dot
            -- command
            crate_graph = {
                -- Backend used for displaying the graph
                -- see: https://graphviz.org/docs/outputs/
                -- default: x11
                backend = "x11",
                -- where to store the output, nil for no output stored (relative
                -- path from pwd)
                -- default: nil
                output = nil,
                -- true for all crates.io and external crates, false only the local
                -- crates
                -- default: true
                full = true,
            }
        },

        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
        server = {}, -- rust-analyer options

        -- debugging stuff
        dap = {
            adapter = {
                type = 'executable',
                command = 'lldb-vscode',
                name = "rt_lldb"
            }
        }
    }

    if server.name == "rust_analyzer" then
        -- Initialize the LSP via rust-tools instead
        require("rust-tools").setup {
            -- The "server" property provided in rust-tools setup function are the
            -- settings rust-tools will provide to lspconfig during init.            -- 
            -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
            -- with the user's own settings (opts).
            server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
        }
        server:attach_buffers()
    else
        server:setup(opts)
    end
end)
EOF

" --- THE END --- "
