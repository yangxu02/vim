set nocompatible " be iMproved
filetype off " required!

"Color Settings {
"set colorcolumn=85           "彩色显示第85行
set t_Co=256                 "设置256色显示
set background=dark          "使用color solarized
set cursorline               "设置光标高亮显示
""set cursorcolumn             "光标垂直高亮
set ttyfast
set ruler                    "当前位置
set backspace=indent,eol,start
colorscheme solarized
"colorscheme evening

let g:solarized_termtrans  = 1
let g:solarized_termcolors = 256
let g:solarized_contrast   = "high"
let g:solarized_visibility = "high"
"}

"tab setting {
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"}
"
"
set autoindent
set autochdir   " 自动切换当前目录为当前文件所在的目录
set hidden      " 允许在有未保存的修改时切换缓冲区，
set nolazyredraw "Don't redraw while executing macros 

set backup
set backupdir=~/.vim/bak

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fenc=utf-8
set encoding=utf-8

set ignorecase "设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch

set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

set laststatus=2
" let g:Powerline_symbols = 'fancy'

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

let mapleader=","

nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
" http://github.com/gmarik/vundle.git
Bundle 'gmarik/vundle'

" vim-scripts repos
""Bundle 'fencview.vim'

Bundle 'ctrlp.vim'
Bundle 'AutoClose'
Bundle 'Tabular'
Bundle 'vim-powerline'
Bundle 'ShowTrailingWhitespace'
Bundle 'neocomplcache'
Bundle 'taglist'

" comment
Bundle 'The-NERD-tree'
"设置相对行号
nmap <leader>nt :NERDTree<cr>:set rnu<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1

Bundle 'The-NERD-Commenter'
let NERDShutUp=1
" 支持单行和多行注释选择"
map <c-h> ,c<space>

" alternate file 
Bundle 'a.vim'

filetype plugin indent on " required!
syntax on
set nu

" =============lisp=================== "
let g:slimv_swank_cmd='!screen -X eval "title swank" "screen sbcl --load /home/yangxu02/.vim/slime/start-swank.lisp" "select swank"'
let g:slimv_ctags = '/usr/bin/ctags -a --language-force=lisp *.lisp *.clj'

" ============ctags=================== "
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" ============cscope=================== "
" 设置quickfox显示查询结果"
set cscopequickfix=s-,c-,d-,i-,t-,e-
" 符号"
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" 定义"
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" 本函数调用"
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> 
" 调用本函数"
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" 本字符串"
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" egrep模式"
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" 本文件"
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" 包含本文件"
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

" ============NeoComplCache=================== "
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

" <TAB> completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

