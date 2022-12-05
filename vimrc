""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic settings for Vim.
" Last updated on 2022. 12. 05.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
let s:vimplug_path=join([$HOME, '.vim', 'autoload', 'plug.vim'], '/')
let s:plugin_root=join([$HOME, '.vim', 'plugged'], '/')

function! s:IS_VIMPLUG_INSTALLED()
    if filereadable(s:vimplug_path)
        return 1
    else
        return 0
    endif
endfunction

function! VIMPLUG_INSTALL()
    if s:IS_VIMPLUG_INSTALLED()
        echomsg 'vim-plug is already installed at: ' s:vimplug_path
    else
        silent execute '!clear'
        execute '!curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -fLo ' s:vimplug_path ' --create-dirs'
    endif
endfunction

function! s:IS_PLUGIN_INSTALLED(plugin_name)
    if isdirectory(join([s:plugin_root, a:plugin_name], '/'))
        return 1
    else
        return 0
    endif
endfunction

function! s:IS_PLUGIN_LOADED(plugin_name)
    if stridx(&runtimepath, a:plugin_name) > -1
        return 1
    else
        return 0
    endif
endfunction

let &compatible=0

if s:IS_VIMPLUG_INSTALLED()
    call plug#begin(s:plugin_root)

    call plug#end()
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI
let g:colors_name='default'
let &background='dark'

if stridx($TERM, '256color') > -1
    let &termguicolors=1
endif

let &laststatus=2
let &ruler=1
let &cmdheight=2

let &splitbelow=1
let &splitright=1

let &mouse='a'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File
let &encoding='utf-8'
let &fileencoding='utf-8'

let &backup=0
let &swapfile=0
let &writebackup=0

let &history=1024

let &undodir=join([$HOME, '.cache', 'vim', 'undo'], '/')
let &undolevels=1024
let &undofile=1

let &updatetime=300

let &shortmess=join([&shortmess, 'c'], '')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor
" let &clipboard='unnamedplus'

let &list=1
let &listchars=join(['extends:>', 'nbsp:·', 'precedes:‹', 'tab:» ', 'trail:·'], ',')

let &hlsearch=1
let &number=1
let &showbreak='    '
let &showmatch=1
let &signcolumn='yes'

let &autoindent=1
let &breakindent=1
let &cindent=1
let &smartindent=1

let &expandtab=1
let &shiftwidth=4
let &tabstop=4
let &wrap=1

let &hidden=1

let &completeopt=join(['menu', 'menuone', 'noinsert', 'noselect', 'preview'], ',')

syntax on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
let &backspace=join(['eol', 'indent', 'start'], ',')

let mapleader=','

nmap <leader>q :q<CR>
nmap <leader>w :w<CR>

nmap <silent> <leader>[ <C-w>h
nmap <silent> <leader>] <C-w>l

nmap <silent> <leader><CR> :let @/=''<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
