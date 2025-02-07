----------------------------------------------------------------------
--
--  █▄ █ ██▀ ▄▀▄ █ █ █ █▄ ▄█   ▄▀▀ ▄▀▄ █▄ █ █▀ █ ▄▀    ▄▀▄ ██▀ █▀▄ ▄▀▄
--  █ ▀█ █▄▄ ▀▄▀ ▀▄▀ █ █ ▀ █   ▀▄▄ ▀▄▀ █ ▀█ █▀ █ ▀▄█   █▀█ █▄▄ █▀▄ ▀▄▀
--
----------------------------------------------------------------------


-----------------------------
-- Bootstrap lazy.nvim
-----------------------------
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

-----------------------------
-- Basic Options & Settings
-----------------------------
vim.opt.exrc = true                           -- Read local .nvimrc if present.
vim.cmd("filetype plugin indent on")          -- Enable filetype detection, plugins & indent.
vim.cmd("syntax on")                          -- Syntax highlighting.

vim.opt.number = true                          -- Show line numbers.
-- vim.opt.relativenumber = true                -- Uncomment to enable relative numbers.
vim.opt.mouse = "a"                            -- Enable mouse.
vim.opt.cursorline = true                      -- Highlight the current line.
vim.opt.cursorcolumn = true                    -- Highlight the current column.
vim.opt.shiftwidth = 4                         -- Indentation: shift width.
vim.opt.tabstop = 4                            -- Indentation: tab stop.
vim.opt.expandtab = true                       -- Use spaces instead of tabs.
vim.opt.backup = false                         -- Do not create backup files.
vim.opt.scrolloff = 10                         -- Keep 10 lines visible above/below cursor.
vim.opt.incsearch = true                       -- Incremental search.
vim.opt.ignorecase = true                      -- Ignore case in search...
vim.opt.smartcase = true                       -- ...unless uppercase is used.
vim.opt.showcmd = true                         -- Show (partial) command in the last line.
vim.opt.showmode = false                       -- Don’t show mode (e.g. -- INSERT --).
vim.opt.showmatch = true                       -- Highlight matching parenthesis.
vim.opt.hlsearch = true                        -- Highlight search results.
vim.opt.clipboard = "unnamedplus"              -- Use system clipboard.
vim.opt.history = 500                          -- Increase command history.
vim.opt.wildmenu = true                        -- Enhanced command-line completion.
vim.opt.wildmode = "list:longest"              -- Bash-like wildmenu.
vim.opt.wildignore:append({ "*.docx", "*.jpg", "*.png", "*.gif", "*.pdf", "*.pyc", "*.exe", "*.flv", "*.img", "*.xlsx" })

vim.cmd([[
  au BufRead,BufNewFile *.vimrc,*.vim set filetype=vim
  au BufRead,BufNewFile kitty.conf set filetype=conf
]])

vim.g.python3_host_prog = "/usr/bin/python3"

-----------------------------
-- Word Processor Mode
-----------------------------
local function WordProcessorMode()
  vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "k", "gk", { noremap = true, silent = true })

  vim.opt_local.textwidth = 85
  vim.opt_local.linebreak = true
  -- vim.opt_local.colorcolumn = "80"
  vim.opt_local.smartindent = true
  vim.opt_local.tabstop = 2
  vim.opt_local.shiftwidth = 4
  vim.opt_local.expandtab = false
  vim.opt_local.wrap = true
  vim.opt_local.wrapmargin = 0

  vim.opt_local.spell = true
  vim.opt_local.spelllang = { "en_gb", "es" }
  vim.cmd("setlocal thesaurus+=~/.vim/spell/mthesaur.txt")
  vim.cmd("setlocal complete+=s")

  vim.api.nvim_buf_set_keymap(0, "i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { noremap = true, silent = true })
end
vim.api.nvim_create_user_command("WP", WordProcessorMode, {})

-----------------------------
-- Plugin Management with lazy.nvim
-----------------------------
require("lazy").setup({
  { "dense-analysis/ale" },
  -- { "preservim/nerdtree" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { 
      "lervag/vimtex", 
      lazy = false,     -- we don't want to lazy load VimTeX
      tag = "v2.15", -- uncomment to pin to a specifig release
      init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
      end
  },
  { "L3MON4D3/LuaSnip", version = "v2.*", buld = "make install_jsregexp" },
  { "SirVer/ultisnips" },
  { "honza/vim-snippets" },
  { "junegunn/goyo.vim" },
  { "junegunn/limelight.vim" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-commentary" },
  { "ghifarit53/tokyonight-vim" },
  { "Rigellute/shades-of-purple.vim" },
  { "challenger-deep-theme/vim", as = "challenger-deep" },
  { "dracula/vim", as = "dracula" },
  { "itchyny/lightline.vim" },
  { "TaDaa/vimade" },
})

-----------------------------
-- Key Mappings
-----------------------------
vim.g.mapleader = ","

vim.keymap.set("n", "<leader>\\", "``", { desc = "Jump to last cursor position" })
vim.keymap.set("n", "<leader>p", ":%w !lp<CR>", { silent = true, desc = "Print file" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<space>", ":", { desc = "Enter command mode" })
vim.keymap.set("n", "o", "o<Esc>", { desc = "New line below" })
vim.keymap.set("n", "O", "O<Esc>", { desc = "New line above" })
vim.keymap.set("n", "n", "nzz", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous search result centered" })
vim.keymap.set("n", "<F5>", ":w<CR>:!clear<CR>:!python3 %<CR>", { desc = "Run Python script" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<C-w>>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Right>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("v", "<Leader>y", '"*y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<Leader>p", '"*p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<Leader>Y", '"+y', { desc = "Yank (alternative)" })
vim.keymap.set("n", "<Leader>P", '"+p', { desc = "Paste (alternative)" })
vim.keymap.set("n", "<Leader>Y", '"+yy', { desc = "Yank line to system clipboard" })
vim.keymap.set("n", "<Leader>rn", ":set relativenumber!<CR>", { desc = "Toggle relative numbers" })
--vim.keymap.set("n", "<F3>", ":NERDTreeToggle<CR>", { desc = "Toggle NERDTree" })
vim.keymap.set("n", "<Leader>w", ":set wrap! wrap?<CR>", { desc = "Toggle line wrap" })

-----------------------------
-- Autocommands
-----------------------------
vim.api.nvim_create_augroup("FileTypeVim", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "FileTypeVim",
  pattern = "vim",
  command = "setlocal foldmethod=marker",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "md",
  command = "setlocal tabstop=4 shiftwidth=4",
})

vim.opt.undodir = os.getenv("HOME") .. "/.vim/backup"
vim.opt.undofile = true
vim.opt.undoreload = 10000

local cursor_group = vim.api.nvim_create_augroup("CursorOff", { clear = true })
vim.api.nvim_create_autocmd("WinLeave", {
  group = cursor_group,
  pattern = "*",
  command = "set nocursorline nocursorcolumn",
})
vim.api.nvim_create_autocmd("WinEnter", {
  group = cursor_group,
  pattern = "*",
  command = "set cursorline cursorcolumn",
})

-----------------------------
-- GUI Specific Settings
-----------------------------
if vim.fn.has("gui_running") == 1 then
  vim.opt.background = "dark"
  vim.opt.guifont = "Monospace Regular 12"
  vim.cmd("set guioptions-=T")
  vim.cmd("set guioptions-=L")
  vim.cmd("set guioptions-=r")
  vim.cmd("set guioptions-=m")
  vim.cmd("set guioptions-=b")
  vim.keymap.set("n", "<F4>", ":if &guioptions =~ 'mTr' | set guioptions-=mTr | else | set guioptions+=mTr | endif<CR>",
    { desc = "Toggle GUI toolbar/scrollbar" })
end

-----------------------------
-- Caesar Cipher Functions (Lua)
-----------------------------
local function shift_char(c, shift)
  local lower = "abcdefghijklmnopqrstuvwxyz"
  local upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  local is_upper = c:match("%u") ~= nil
  local alphabet = is_upper and upper or lower
  local i = alphabet:find(c, 1, true)
  if i then
    local new_i = ((i - 1 + shift) % 26) + 1
    return alphabet:sub(new_i, new_i)
  else
    return c
  end
end

local function caesar_cipher_line(line, shift)
  local result = {}
  for i = 1, #line do
    local char = line:sub(i, i)
    table.insert(result, shift_char(char, shift))
  end
  return table.concat(result)
end

vim.api.nvim_create_user_command("CaesarToggleE", function(opts)
  local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)
  for idx, line in ipairs(lines) do
    lines[idx] = caesar_cipher_line(line, 3)
  end
  vim.api.nvim_buf_set_lines(0, opts.line1 - 1, opts.line2, false, lines)
end, { range = true })

vim.api.nvim_create_user_command("CaesarToggleD", function(opts)
  local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)
  for idx, line in ipairs(lines) do
    lines[idx] = caesar_cipher_line(line, -3)
  end
  vim.api.nvim_buf_set_lines(0, opts.line1 - 1, opts.line2, false, lines)
end, { range = true })

-- 
vim.keymap.set("v", "<Leader>ce", ":CaesarToggleE<CR>", { desc = "Encode Caesar cipher" })
vim.keymap.set("v", "<Leader>cd", ":CaesarToggleD<CR>", { desc = "Decode Caesar cipher" })

-----------------------------
-- Lightline Configuration
-----------------------------
vim.g.lightline = {
  colorscheme = 'deus',
  active = { left = { { 'mode', 'paste' },
                       { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'FugitiveHead' },
  component = { filename = '%F' },
}

-----------------------------
-- Limelight Configuration
-----------------------------
vim.g.limelight_conceal_ctermfg = 240
vim.g.limelight_conceal_guifg = '#777777'
vim.g.limelight_default_coefficient = 0.7
vim.g.limelight_paragraph_span = 0
vim.g.limelight_bop = '^\\s'
vim.g.limelight_eop = '\\ze\\n^\\s'
vim.g.limelight_priority = -1
vim.cmd("autocmd! User GoyoEnter Limelight")
vim.cmd("autocmd! User GoyoLeave Limelight!")

-----------------------------
-- NERDTree Configuration
-----------------------------
--vim.g.NERDTreeWinPos = "right"
--vim.cmd([[
--  autocmd StdinReadPre * let s:std_in=1
--  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
--]])
--vim.g.NERDTreeIgnore = { '\\.git$', '\\.jpg$', '\\.mp4$', '\\.ogg$', '\\.iso$', '\\.pdf$', '\\.pyc$', '\\.odt$', '\\.png$', '\\.gif$', '\\.db$' }

-- nvim-tree.lua configuration
require("nvim-tree").setup({
  view = {
    side = "right",    -- Position the file tree on the right
    width = 30,        -- Set tree width in columns
  },
  filters = {
    custom = { "\\.git$", "\\.jpg$", "\\.mp4$", "\\.ogg$", "\\.iso$", "\\.pdf$", "\\.pyc$", "\\.odt$", "\\.png$", "\\.gif$", "\\.db$" },
  },
  actions = {
    open_file = {
      quit_on_open = true,  -- Close the tree when you open a file
    },
  },
})

-- Auto open nvim-tree when Neovim starts without any file arguments
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      require("nvim-tree.api").tree.toggle({ focus = false })
    end
  end,
})

-----------------------------
-- VimTeX Configuration
-----------------------------
--vim.cmd("filetype plugin indent on")
--vim.cmd("syntax enable")
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'
--vim.g.vimtex_compiler_method = 'latexrun'
vim.g.maplocalleader = ","

-----------------------------
-- Colorscheme & UI Tweaks
-----------------------------
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end
vim.cmd("colorscheme shades_of_purple")
vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi Statusline ctermbg=magenta")


-----------------------------
-- Reset backgroung colors after closing :Goyo
-----------------------------
vim.api.nvim_create_autocmd("User", {
  pattern = "GoyoLeave",
  callback = function()
    -- Reset the Normal highlight to have no background
    vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
    -- Reset the Statusline highlight to your desired color
    vim.cmd("hi Statusline ctermbg=magenta")
  end,
})

