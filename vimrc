" vim:ft=vim:foldmethod=marker:
" options {{{
setlocal foldmethod=marker
set list
set listchars=tab:→\ ,eol:⏎
set nocompatible
".nvim.lua .nvimrc .exrc
set exrc

filetype on
syntax on
set termguicolors
if !has('nvim')
    colorscheme slate
endif
highlight! CursorLine gui=underline cterm=underline

set backup
set backupdir=~/.cache/nvim/backup
set undofile
set undodir=~/.cache/nvim/undo
set swapfile
set directory=~/.cache/nvim/swap

set autoread
set autowriteall
set history=1000

" 编码
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030,latin1
set fileformat=unix
set fileformats=unix,dos

set cursorline
"set colorcolumn=80
set number
set numberwidth=2
set scrolloff=8
set sidescrolloff=10
set ruler
set showcmd
set noshowmode
set wildmenu
if has('nvim')
    " vim default: auto
    set signcolumn=auto:1-2
endif

" 缩进与格式
filetype indent on
set autoindent
set smarttab
set cindent
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set backspace=eol,start,indent

set textwidth=100
" set linebreak
set wrap

" 搜索
set hlsearch
set incsearch
set ignorecase
set smartcase

set splitright
set diffopt=vertical,filler,context:4

set pumheight=20

" set spell
" set spelllang=en_us


set hidden
set updatetime=300

let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:ROOT_MARKERS = [ '.git', '.hg', '.svn', '.root', '.project', 'Makefile' ]
" append runtimepath
set rtp+=~/.config/nvim/my-snippets/

" }}}

" keymaps {{{
" ------------------------------------------------------------------------------
" -- Mode           | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang | ~
" -- Command        +------+-----+-----+-----+-----+-----+------+------+ ~
" -- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
" -- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
" -- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
" -- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
" -- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
" -- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
" -- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
" -- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
" -- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
" -- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
" -- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |
" -- Modes
" -- normal_mode = "n",
" -- insert_mode = "i",
" -- visual_mode = "v",
" -- visual_block_mode = "x",
" -- term_mode = "t",
" -- command_mode = "c",

set mouse=nv " nvi default

"let mapleader = "\<Space>"
"let maplocalleader = "\<Space>"
let mapleader = "'"
let maplocalleader = "'"

"inoremap jj <Esc> " 有cmp-rime 的时候不适合开启
inoremap jk <esc>:w<cr>
inoremap jj <esc>

" C-r用作搜索替换
nnoremap U <C-r>
nnoremap <C-z> u
vnoremap <C-z> u

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" mini.move
nnoremap <M-j> :m +1<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
nnoremap <M-k> :m -2<CR>==
vnoremap <M-k> :m '<-2<CR>gv=gv
nnoremap <M-h> <<
vnoremap <M-h> <gv
nnoremap <M-l> >>
vnoremap <M-l> >gv

" H, L jump to line home / end
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
onoremap H ^
onoremap L $

nnoremap J <Nop>

" search
nnoremap n nzz<cmd>set hlsearch<CR>
nnoremap N Nzz<cmd>set hlsearch<CR>
nnoremap * *N<cmd>set hlsearch<CR>
nnoremap # #N<cmd>set hlsearch<CR>

" q/Q and quit
nnoremap Q q
vnoremap Q q
nnoremap q <Nop>
vnoremap q <Nop>
nnoremap <leader>x <cmd>x<CR>
nnoremap <leader>q <cmd>bd<CR>
nnoremap <leader>w <cmd>w<CR>
nnoremap <leader>Q <cmd>copen<CR>

" cut and paste
" TODO:在展开snippet的时候会进入v模式,如果要输入p开头的单词会触发粘贴
nnoremap x "_x
nnoremap X "_X
snoremap p i<BS>p
vnoremap p P
vnoremap P p
inoremap <C-v> <C-o>p

" format
nnoremap <leader>= gg=G
nnoremap == gg=G
vnoremap > >gv
vnoremap < <gv

" user defined textobject
onoremap <silent>ie :<C-u>normal! ggVG<CR>
xnoremap <silent>ie :<C-u>normal! ggVG<CR>
onoremap <silent>ae :<C-u>normal! ggVG<CR>
xnoremap <silent>ae :<C-u>normal! ggVG<CR>

onoremap w aw
xnoremap w aw
onoremap W aW
xnoremap W aW

onoremap <silent>i, i<
onoremap <silent>a, a<
xnoremap <silent>i, i<
xnoremap <silent>a, a<

onoremap <silent>i. i>
onoremap <silent>a. a>
xnoremap <silent>i. i>
xnoremap <silent>a. a>

onoremap <silent>i9 i(
onoremap <silent>a9 a(
xnoremap <silent>i9 i(
xnoremap <silent>a9 a(

onoremap <silent>i0 i)
onoremap <silent>a0 a)
xnoremap <silent>i0 i)
xnoremap <silent>a0 a)

" switch window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" split window
nnoremap <C-w>-  <cmd>split<CR>
nnoremap <C-w>\| <cmd>vsplit<CR>

" resize window
nnoremap <C-Up>    <cmd>resize +2<CR>
nnoremap <C-Down>  <cmd>resize -2<CR>
nnoremap <C-Left>  <cmd>vertical resize +2<CR>
nnoremap <C-Right> <cmd>vertical resize -2<CR>

" previous and next buffer
nnoremap <C-n> <cmd>bnext<CR>
nnoremap <C-p> <cmd>bprevious<CR>

" emacs mode in insert_mode
inoremap <C-d>   <Del>
inoremap <C-a>   <Home>
inoremap <C-e>   <End>
inoremap <C-f>   <Right>
inoremap <C-b>   <Left>
inoremap <C-Del> <C-o>dw
inoremap <C-k>   <C-o>c$

inoremap <M-w> <C-Right>
inoremap <M-b> <C-Left>


" fold
nnoremap zi zc
nnoremap z<CR> za

" simple auto-pair
if !has('nvim')
    inoremap ( ()<Left>
    inoremap <expr> ) getline(line('.'))[col('.')-1]==')' ? '<Right>' : ')'

    inoremap [ []<Left>
    inoremap <expr> ] getline(line('.'))[col('.')-1]==']' ? '<Right>' : ']'

    inoremap { {}<Left>
    inoremap <expr> } getline(line('.'))[col('.')-1]=='}' ? '<Right>' : '}'

    inoremap < <><Left>
    inoremap <expr> > getline(line('.'))[col('.')-1]=='>' ? '<Right>' : '>'

    " inoremap ' ''<Left>
    " inoremap <expr> ' getline(line('.'))[col('.')-1]=="'" ? '<Right>' : "'"
    " inoremap " ""<Left>
    " inoremap <expr> " getline(line('.'))[col('.')-1]=='"' ? '<Right>' : '"'
    " inoremap ` ``<Left>
    " inoremap <expr> ` getline(line('.'))[col('.')-1]=='`' ? '<Right>' : '`'
endif

inoremap <C-l> <C-o>zz
nnoremap G Gzz

cnoremap <expr> ;; getcmdtype() == ':' ? expand('%:p:h') .'/' : ';p'
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
cnoremap <M-b> <C-Left>
cnoremap <M-f> <C-Right>
" }}}

" autocmd {{{
augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,checkhealth,startuptime nnoremap <silent><buffer> q <cmd>close<CR>
    "autocmd FileType json,json5,yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType json,json5,yaml,help setlocal cursorcolumn
    autocmd FileType help setlocal nowrap
    if has('nvim')
        autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({ timeout = 500 })
    endif
    autocmd BufWinEnter * set formatoptions-=cro
    autocmd CursorHold * set nohlsearch
augroup end

if has('wsl')
    let s:clip = '/mnt/c/Windows/System32/clip.exe'
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup end
    endif
else
    set clipboard=unnamedplus
endif

if executable('fcitx5-remote')
    function! FcitxInsEnter()
        " im_status: 1 inactive
        " im_status: 2 active
        if !exists('b:im_status')
            let b:im_status = system('fcitx5-remote')
        endif
        if system('fcitx5-remote') != b:im_status
            call system('fcitx5-remote -t')
        endif
    endfunction

    function! FcitxInsLeave()
        let b:im_status = system('fcitx5-remote')
        call system('fcitx5-remote -c')
    endfunction

    augroup Fcitx5
        autocmd!
        autocmd InsertEnter * :call FcitxInsEnter()
        autocmd InsertLeave * :call FcitxInsLeave()
    augroup end
endif
" }}}

" gui config {{{
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    if has('win32') || has('mac') || has('nvim')
        set guifont=JetBrainsMono\ Nerd\ Font:10,Consolas:10
    else
        set guifont=JetBrainsMono\ Nerd\ Font\ 10,Consolas\ 10,DejaVu\ Sans\ Mono\ 10
    endif
endif
" }}}

" vim only config {{{
if has('nvim')
    finish
endif

" builtin plugin: netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
set fillchars=vert:\⎜
nnoremap <leader>e :Lexplore<CR>
autocmd FileType netrw nnoremap <buffer><nowait> q <cmd>close<CR>

" complete menu
set completeopt=menu,preview
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
set omnifunc=syntaxcomplete#Complete

" vim-airline
let g:airline_section_z = airline#section#create(["%{line('.')}/%{line('$')}"])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nnoremap <leader>1 <Plug>AirlineSelectTab1
nnoremap <leader>2 <Plug>AirlineSelectTab2
nnoremap <leader>3 <Plug>AirlineSelectTab3
nnoremap <leader>4 <Plug>AirlineSelectTab4
nnoremap <leader>5 <Plug>AirlineSelectTab5
nnoremap <leader>6 <Plug>AirlineSelectTab6
nnoremap <leader>7 <Plug>AirlineSelectTab7
nnoremap <leader>8 <Plug>AirlineSelectTab8
nnoremap <leader>9 <Plug>AirlineSelectTab9
nnoremap <C-p>     <Plug>AirlineSelectPrevTab
nnoremap <C-n>     <Plug>AirlineSelectNextTab

"}}}
