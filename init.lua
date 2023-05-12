-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true




function map(mode, lhs, rhs, opts)
        local options = { noremap = true }
        if opts then
                options = vim.tbl_extend("force", options, opts)
        end
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<C-h>', ":wincmd h<CR>")
map('n', '<C-j>', ":wincmd j<CR>")
map('n', '<C-k>', ":wincmd k<CR>")
map('n', '<C-l>', ":wincmd l<CR>")

map('n', '<S-tab>', ":bnext<CR>")

map('n', '<C-s>', ":w<CR>")
map('i', '<C-s>', ":w<CR>")
map('v', '<C-s>', ":w<CR>")



local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require('lualine').setup {
        options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                }
        },
        sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
        },
        inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
        },
        tabline = {
                lualine_a = {
                        {
                                'buffers',
                                show_filename_only = true, -- Shows shortened relative path when set to false.
                                hide_filename_extension = false, -- Hide filename extension when set to true.
                                show_modified_status = true, -- Shows indicator when the buffer is modified.

                                mode = 2, -- 0: Shows buffer name
                                -- 1: Shows buffer index
                                -- 2: Shows buffer name + buffer index
                                -- 3: Shows buffer number
                                -- 4: Shows buffer name + buffer number
				
                                max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                                -- it can also be a function that returns
                                -- the value of `max_length` dynamically.
                                filetype_names = {
					TelescopePrompt = 'Telescope',
					dashboard = 'Dashboard',
					packer = 'Packer',
					fzf = 'FZF',
					alpha = 'Alpha'
				}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

				
                                buffers_color = {
                                        -- Same values as the general color option can be used here.
                                        active = {fg='#FFFFFF', bg='#737173'}, -- Color for active buffer.
                                        inactive = {fg='#737173', bg='#464447'}, -- Color for inactive buffer.
                                },
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
		 
                                symbols = {
                                        modified = ' ●', -- Text to show when the buffer is modified
                                        alternate_file = '#', -- Text to show to identify the alternate file
                                        directory = '', -- Text to show when the buffer is a directory
                                },
                        }
                },

                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'tabs' }
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {}
}

vim.cmd("NERDTree")




local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end


-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)




local colorscheme = "monokai_pro"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not ok then
        vim.notify("colorscheme " .. colorscheme .. "not found!")
        return
end



