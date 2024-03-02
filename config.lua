--reload("langs.go-config")
--reload("langs.rust-config")
-- Set space as the leader key
-- CONFIGURACION EPICA GAMER
-- set wrap
-- set indent
-- set smartindent
-- set autoindent
vim.g.mapleader = ' '



-- CONFIGURACION EPICA GAMER

-- Activar el ajuste de líneas
vim.o.wrap = true

-- Activar la sangría automática
vim.o.autoindent = true

-- Activar la sangría inteligente
vim.o.smartindent = true

-- Activar la sangría
vim.o.indentexpr = "autoindent"

-- Configuración adicional según tus preferencias

-- Por ejemplo, configurar el ancho de tabulación a 4 espacios
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Desactivar el resaltado de búsqueda mientras escribes
vim.o.incsearch = false

-- Desactivar la resalta automática de la línea actual
-- vim.o.cursorline = false

-- Activar breakindent
vim.o.breakindent = true
-- Configurar la línea número
-- vim.o.number = true

-- Guardar la posición del cursor entre sesiones
vim.cmd([[au! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- Guardar automáticamente los archivos antes de cambiar de ventana
vim.cmd([[au FocusLost * :wa]])
-- Configurar otros ajustes según tus preferencias
-- Example mapping: Remap leader + w to save the current file
--
--
-- (asdfasdf)
--
vim.api.nvim_set_keymap('n', '0', '_', { noremap = true })
vim.api.nvim_set_keymap('v', '0', '_', { noremap = true })
vim.api.nvim_set_keymap('n', '4', '$', { noremap = true })
vim.api.nvim_set_keymap('v', '4', '$h', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-9>', 'vi(', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-{>', 'vi{', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-[>', 'vi[', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-9>', 'ci(', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>9', 'vi(', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-\'>', 'ci"', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>\'', 'vi"', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-[>', 'ci{', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>[', 'vi{', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-]>', 'ci[', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>]', 'vi[', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>O<Tab>return err<Esc>',
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>', 'm]ggvG=\']', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>z', ':ZenMode<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<D-,>', [[fmt.Println()<Esc>ha]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-,>', [[fmt.Println()<Esc>ha]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<D-.>', [[if err != nil {<CR><Tab>return err<CR>}<Esc>k]],
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-.>', [[if err != nil {<CR><Tab>return err<CR>}<Esc>k]],
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'kj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>a', '<C-^>', { noremap = true, silent = true })
-- Mapeo para pegar desde el registro "0 con la tecla F1 en modo normal
--
vim.api.nvim_set_keymap('n', '<F1>', '"0p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F2>', '"1p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F3>', '"2p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F4>', '"3p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F5>', '"4p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<F6>', ':s/\\%V //g<CR>', { noremap = true, silent = true })

local low = function(i) return string.char(97 + i) end
local upp = function(i) return string.char(65 + i) end

for i = 0, 25 do vim.keymap.set("n", "m" .. low(i), "m" .. upp(i)) end
for i = 0, 25 do vim.keymap.set("n", "m" .. upp(i), "m" .. low(i)) end
for i = 0, 25 do vim.keymap.set("n", "'" .. low(i), "'" .. upp(i)) end
for i = 0, 25 do vim.keymap.set("n", "'" .. upp(i), "'" .. low(i)) end

vim.opt.relativenumber = true
lvim.plugins = {
    "kristijanhusak/vim-dadbod-ui",
    "tpope/vim-dadbod",
    {
        "kristijanhusak/vim-dadbod-completion",
        event = 'VeryLazy',
        config = function()
            local function db_completion()
                require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
            end
            vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "sql",
                },
                command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "sql",
                    "mysql",
                    "plsql",
                },
                callback = function()
                    vim.schedule(db_completion)
                end,
            })
        end
    },
    {
        "kawre/neotab.nvim",
        event = "InsertEnter",
        opts = {
            -- configuration goes here
        },
    },
    "sainnhe/gruvbox-material",
    {
        "wellle/context.vim",
        event = 'VeryLazy',
    },
    { "ellisonleao/gruvbox.nvim",  priority = 1000, config = true, opts = ... },
    "lunarvim/horizon.nvim",
    "nyngwang/nvimgelion",
    "Mofiqul/dracula.nvim",
    "catppuccin/nvim",
    {
        'folke/zen-mode.nvim',
        event = 'VeryLazy',
        opts = {
            window = {
                backdrop = 0.96,          -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                width = 80,               -- width of the Zen window
                height = 1,               -- height of the Zen window
                options = {
                    signcolumn = "no",    -- disable signcolumn
                    cursorcolumn = false, -- disable cursor column
                }
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = true,    -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    laststatus = 0,  -- turn off the statusline in zen mode
                }
            }
        }
    },
    {
        "ggandor/leap.nvim",
        event = 'VeryLazy',
        config = function()
            require('leap').add_default_mappings()
        end
    },
    {
        'barrett-ruth/live-server.nvim',
        build = 'yarn global add live-server',
        config = true
    },
    {
        'ThePrimeagen/harpoon',
        event = 'VeryLazy',
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>t", mark.add_file)
            vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu)

            vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
        end
    },
    { 'mhartington/formatter.nvim' },
}
-- Establecer el fondo a gris oscuro

-- Change the background of lualine_c section for normal mode

-- vim.defer_fn(function()
--     -- Cambiar el color de fondo después de cargar el esquema de colores
--     vim.cmd([[hi Normal guibg=#121212 ctermbg=235]])
-- end, 0)

lvim.colorscheme = 'horizon'

lvim.lsp.on_attach_callback = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
end

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "blade"
}

local capabilities = require("lvim.lsp").common_capabilities()
--asdf
require("lvim.lsp.manager").setup("htmx", {
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = capabilities,
})

-- require("lvim.lsp.manager").setup("sqlls", {
--     on_attach = require("lvim.lsp").common_on_attach,
--     on_init = require("lvim.lsp").common_on_init,
--     filetypes = { 'sql', 'db' },
--     root_dir = function(_)
--         return vim.loop.cwd()
--     end,
--     capabilities = capabilities,
-- })


require("lvim.lsp.manager").setup("html", {
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = capabilities,
})

require("lvim.lsp.manager").setup("html", {
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = capabilities,
})


-- init.lua

require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })

local luasnip = require "luasnip"
luasnip.filetype_extend("javascriptreact", { "html" })

require("luasnip/loaders/from_vscode").lazy_load()

vim.cmd("autocmd BufNewFile,BufRead *.tmpl setfiletype html")
vim.cmd("autocmd BufNewFile,BufRead *.blade.php setfiletype html")

function Err_nil()
    vim.api.nvim_put({ "if err != nil {}" }, "c", true, true)
end

-- Asigna la función a una combinación de teclas (puedes cambiarlo según tus preferencias)
vim.api.nvim_set_keymap('n', '<Leader>hm', [[:lua Err_nil()<CR>]], { noremap = true, silent = true })
lvim.format_on_save.enabled = true
