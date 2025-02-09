<<<<<<< HEAD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                       
"
"     █ █ █ █▄ ▄█ █▀▄ ▄▀▀   ▄▀▄ ██▀ █▀▄ ▄▀▄
"     ▀▄▀ █ █ ▀ █ █▀▄ ▀▄▄   █▀█ █▄▄ █▀▄ ▀▄▀
"         
"     Edited:     Andres Olivo
"     Date:       2023.08.16
"     Source:     https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
"    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   To realod .vimrc run :so%
"   To install a plugin run :PlugInstall 

set nocompatible                " Disable compatibility with vi which can cause unexpected issues.
set exrc                        " vim will look for .vimrc in the directory vim was started
filetype on                     " Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype plugin on              " Enable plugins and load plugin for the detected file type.
filetype indent on              " Load an indent file for the detected file type.
syntax on                       " Turn syntax highlighting on.
set number                      " Add numbers to the file.
"set relativenumber              " set relative number
set mouse=a                     " enable mouse
set cursorline                  " Highlight cursor line underneath the cursor horizontally.
set cursorcolumn                " Highlight cursor line underneath the cursor vertically.
set shiftwidth=4                " Set shift width to 4 spaces.
set tabstop=4                   " Set tab width to 4 columns.
set expandtab                   " Use space characters instead of tabs.
set nobackup                    " Do not save backup files.
set scrolloff=10                " Do not let cursor scroll below or above N number of lines when scrolling.
"set nowrap                      " Do not wrap lines. Allow long lines to extend as far as the line goes.
set wrap
set incsearch                   " While searching though a file incrementally highlight matching characters as you type.
set ignorecase                  " Ignore capital letters during search.
set smartcase                   " {Override the ignorecase option if searching for capital letters.
                                "   This will allow you to search specifically for capital letters.}
set showcmd                     " Show partial command you type in the last line of the screen.
set noshowmode                  " Show the mode you are on the last line.
set showmatch                   " Show match,ng words during a search.
set hlsearch                    " Use highlighting when doing a search.
set clipboard=unnamedplus       " Using system clipboard
set history=500                 " Set the commands to save in history default number is 20.
set wildmenu                    " Enable auto completion menu after pressing TAB.
set wildmode=list:longest       " Make wildmenu behave like similar to Bash completion.

" For .vimrc and other vim script files to set filetype
au BufRead,BufNewFile *.vimrc,*.vim set filetype=vim
au BufRead,BufNewFile kitty.conf set filetype=conf

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" to open these foldings, use: 
"   zo: open a single fold under the cursor
"   zc: close the fold under the cursor 
"   zR: open all folds
"   zM: close all folds

" WORD PROCESSOR --------------------------------------------------------- {{{

" source: https://www.maketecheasier.com/turn-vim-word-processor/

func! WordProcessorMode()
   
    " movement changes
    map j gj
    map k gk
   
    "" formating text
    "setlocal textwidth=80
    "setlocal smartindent
    "setlocal tabstop=2
    "setlocal shiftwidth
    ""setlocal formatoptions=1
    "setlocal noexpandtab
    "setlocal wrap
    "setlocal linebreak
    "setlocal wrapmargin=0
    
    setlocal textwidth=80
    setlocal wrap
    setlocal linebreak
    setlocal smartindent
    setlocal tabstop=2
    setlocal shiftwidth=4
    setlocal noexpandtab
    setlocal wrapmargin=0
    
    " spelling and thesaurus
    setlocal spell spelllang=en_gb,es
    
    " (ctrl + x) followed by (ctrl + t)
    set thesaurus +=~/.vim/spell/mthesaur.txt 
    
    " complete+=s makes autocompletion word search the thesaurus with (ctrl+n)
    " or (ctrl+p)
    set complete+=s
   
    " ctrl+l to correct misspell 
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u 

endfu
com! WP call WordProcessorMode()

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'

  Plug 'lervag/vimtex'

  Plug 'SirVer/ultisnips'

  Plug 'honza/vim-snippets'                 " something 

  Plug 'junegunn/goyo.vim'                  " Distraction-free writing in Vim.

  Plug 'junegunn/limelight.vim'             " Focus current text; best served with Goyo

  Plug 'tpope/vim-fugitive'

  Plug 'tpope/vim-commentary'

  Plug 'ghifarit53/tokyonight-vim'

  Plug 'Rigellute/shades-of-purple.vim'

  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

  Plug 'dracula/vim', { 'as': 'dracula' }

  Plug 'itchyny/lightline.vim'

  Plug 'TaDaa/vimade'

call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Set the backslash as the leader key.
" let mapleader = "\<lt>"
let mapleader = ","

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
"nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" We map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

"   clipboard mappings
vnoremap <Leader>y "*y
noremap  <Leader>p "*p
vnoremap <Leader>Y "+y
noremap  <Leader>P "+y
nnoremap <Leader>Y "+yy

"   Toggle on/off the relative number
nnoremap <Leader>rn :set relativenumber! <CR>

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" wrapped lines
nnoremap <Leader>w :set wrap! wrap?<CR>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

autocmd Filetype md setlocal tabstop=4 shiftwidth=4 

" If the current file type is tex,
" autocmd Filetype tex setlocal tabstop=2 shiftwidth=2 expandtab textwidth=90

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    " colorscheme molokai

    " Set a custom font you have installed on your computer.
    " Syntax: <font_name>\ <weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the left-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" Function to shift characters for Caesar cipher
function! ShiftChar(char, shift)
    let lcase = 'abcdefghijklmnopqrstuvwxyz'
    let ucase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    let is_upper = a:char =~ '\u'
    let alphabet = is_upper ? ucase : lcase
    let shifted_index = (stridx(alphabet, a:char) + a:shift) % 26
    if shifted_index < 0
        let shifted_index += 26
    endif
    return strcharpart(alphabet, shifted_index, 1)
endfunction

" Function to toggle Caesar cipher encoding/decoding on selected text
function! ToggleCaesarCipher()
    " Save the cursor position
    let save_cursor = getcurpos()
    " Yank the selected text into the "x" register to preserve "@" register
    normal! gvy
    let text = @x
    " Decode or encode considering both cases
    let decoded = substitute(text, '\a', '\=ShiftChar(submatch(0), -3)', 'g')
    if decoded == text
        let encoded = substitute(text, '\a', '\=ShiftChar(submatch(0), 3)', 'g')
        let result = encoded
    else
        let result = decoded
    endif
    " Replace the selected text with the result
    normal! gv"_d
    let @x = result
    normal! P
    " Restore the cursor position
    call setpos('.', save_cursor)
endfunction


" }}}

" lightline.vim ---------------------------------------------------------- {{{

"   adding full path to statusline: https://github.com/itchyny/lightline.vim/issues/386
let g:lightline = {
    \ 'colorscheme': 'deus',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]   
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'component': {
    \   'filename': '%F',
    \ }
    \ }

" }}}

" limelight --------------------------------------------------------------- {{{
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}

" NERDTree --------------------------------------------------------------- {{{

let g:NERDTreeWinPos="right"

"   start NERTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" }}}

" VIMTEX ---------------------------------------------------------------- {{{

" source : https://github.com/lervag/vimtex
	
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" }}}

" COLOUR SCHEMES --------------------------------------------------------- {{{

if (has("termguicolors"))
    set termguicolors
endif

"colorscheme challenger_deep
colorscheme shades_of_purple
"colorscheme tokyonight
"colorscheme dracula

" seting terminal background colour 
hi Normal ctermbg=NONE guibg=NONE

hi Statusline ctermbg=magenta

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
"set statusline=


" Status line left side.
"set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
"set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
"set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
"set laststatus=2

" }}}

" ULTISNIPS -------------------------------------------------------------- {{{

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsEditSplit='vertical'


" }}}

" CAESAR CIPHER FUNCTION    --------------------------------------------- {{{

" Define a function that applies a Caesar cipher to a range of text lines
function! CaesarCipherToggle() range
    " Define the shift amount for the Caesar cipher
    let l:shift = 3
    " Pattern to match alphabetical characters
    let l:pattern = '\%(\l\|\u\)'
    " Retrieve the lines of text within the specified range
    let l:text = getline(a:firstline, a:lastline)
    " Initialize an empty list to store the result
    let l:result = []

    " Iterate over each line of text
    for l:line in l:text
        " Initialize an empty string to store the encoded line
        let l:encodedLine = ''
        " Iterate over each character in the line
        for l:i in range(len(l:line))
            " Extract the current character
            let l:char = l:line[l:i]
            " Check if the character is alphabetical
            if l:char =~ l:pattern
                " Determine if the character is uppercase
                let l:isUpper = l:char =~ '\u'
                " Set the base ASCII number for 'A' or 'a'
                let l:base = l:isUpper ? char2nr('A') : char2nr('a')
                " Calculate the offset for the character within the alphabet
                let l:offset = (char2nr(l:char) - l:base + l:shift) % 26
                " Generate the encoded character
                let l:encodedChar = nr2char(l:base + l:offset)
                " Append the encoded character to the encoded line
                let l:encodedLine .= l:encodedChar
            else
                " Append non-alphabetical characters unchanged
                let l:encodedLine .= l:char
            endif
        endfor
        " Add the encoded line to the result list
        call add(l:result, l:encodedLine)
    endfor

    " Replace the original text lines with the encoded lines
    call setline(a:firstline, l:result)
endfunction

" Define a function that decodes text encoded with the Caesar cipher
function! CaesarCipherDecode() range
    " Define the shift amount used in the Caesar cipher (inverse operation)
    let l:shift = -3
    " Pattern to match alphabetical characters
    let l:pattern = '\%(\l\|\u\)'
    " Retrieve the lines of text within the specified range
    let l:text = getline(a:firstline, a:lastline)
    " Initialize an empty list to store the result
    let l:result = []

    " Iterate over each line of text
    for l:line in l:text
        " Initialize an empty string to store the decoded line
        let l:decodedLine = ''
        " Iterate over each character in the line
        for l:i in range(len(l:line))
                " Handle negative offset to wrap correctly around the alphabet
                if l:offset < 0
                    let l:offset += 26
                endif
                " Generate the decoded character
                let l:decodedChar = nr2char(l:base + l:offset)
                " Append the decoded character to the decoded line
                let l:decodedLine .= l:decodedChar
            else
                " Append non-alphabetical characters unchanged
                let l:decodedLine .= l:char
            endif
        endfor
        " Add the decoded line to the result list
        call add(l:result, l:decodedLine)
    endfor

    " Replace the original text lines with the decoded lines
    call setline(a:firstline, l:result)
endfunction


command! -range=% CaesarToggleE <line1>,<line2>call CaesarCipherToggle()
command! -range=% CaesarToggleD <line1>,<line2>call CaesarCipherDecode()

"   encode
vnoremap <Leader>ce :CaesarToggleE<CR>
"   decode
vnoremap <Leader>cd :CaesarToggleD<CR>



" }}}
=======
" Use the Solarized Dark theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
>>>>>>> 3fbceb469cc52f021b11f4a0d335c4362366cac4
