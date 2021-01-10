set nocompatible              " be iMproved, required
set backspace=indent,eol,start
filetype off                  " required
syntax on
xnoremap p pgvy

set encoding=utf-8

set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=DejaVuSansMono_NF:h14:cANSI:qDRAFT
:set iskeyword+=-

"backsapce fix
"set bs=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/SimpylFold'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" {'do': 'yarn install --frozen-lockfile'} 
" And then :call coc#util#install()
"       CocInstall coc-flutter (with :)
"       CocInstall coc-rls coc-rust-analyzer
"       :CocInstall coc-json coc-tsserver
"       :CocInstall coc-sql coc-css
Plugin 'ap/vim-css-color'
"Plugin 'emmanuelgrognet/vim-cobol-syntax-checker'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" File browsing
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" NERDTree on start
" autocmd vimenter * NERDTree

" Shortcur NERDTree
map <C-n> :NERDTreeToggle<CR>

" Line numbering
set nu

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"

" Auto-Complete
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntax
execute pathogen#infect()
filetype plugin indent on
"let g:syntastic_python_checkers = ['pylint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_cs_checkers = []
" let g:syntastic_rust_checkers = []
" Colors schemes
if has('gui_running')
  set background=dark
"  colorscheme solarized
  colorscheme zenburn
else
  colorscheme zenburn
endif
call togglebg#map("<F5>")

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufNewFile,BufRead *.cbl,*.cpy,*.cpe
    \ set path+=c:\\immob8\\** |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=72 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=dos |
    \ set fileencoding=latin1 |
    \ set colorcolumn=7,12,50,72 |

au BufNewFile,BufRead *.vimrc,*.conf
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

" Toogle bar
autocmd FileType c,cpp,cs,python,typescript,rust,cobol nested :TagbarOpen
let g:tagbar_sort = 0
nmap <F8> :TagbarToggle<CR>

" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256  colours)
set t_Co=256

let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")

" disable ycm
let g:loaded_youcompleteme = 1

au BufRead,BufNewFile *.eco set filetype=cobol
au BufRead,BufNewFile *.cpe set filetype=cobol
au! Syntax cobol source ~\.vim\\cobol.vim

let g:tagbar_type_cobol = {
            \ 'kinds'     : [
				\ 'r:jjr',
                \ 's:sections',
            \ ],
        \ }
" Je trouve que ça fais trop dans la barre de gauche
"				\ 'd:data',
"				\ 'g:group',
"				\ 'c:call',

nmap <silent>gd :exec '/' expand('<cword>') 'SECTION.'<CR><CR>
"shellescape(fnameescape(expand('<cword>')))
nmap <silent>g9 :exec 'vimgrep /FD  '.expand('<cword>').'/ C:\immob8\cop\*.cpy'<CR><CR>
nmap <silent>g0 :exec 'vimgrep " ' expand('<cword>') 'SECTION" C:\immob8\*.cbl'<CR><CR>
nmap <silent>g8 :exec 'vimgrep /==TSAB-FUNC '.expand('<cword>').'==/ C:\immob8\cop\*.cpy'<CR><CR>
nmap <silent>g7 :exec 'o C:\immob8\'.expand('<cword>').'.cbl'<CR>
nmap <silent>g6 :exec '/==TSAB-FUNC '.expand('<cword>').'=='<CR><CR>
" go to bwd
nmap <silent>gt :exec '?' expand('<cword>').'.'<CR><CR>
" go to fwd
nmap <silent>gf :exec '/' expand('<cword>').'.'<CR><CR>
"nmap <silent>c0 :w<CR>:!.\tools\MAKE1FILE_NOUEDIT.BAT %:t<CR>
"nmap <silent>c0 :w<CR>:call setloclist(0, [])<CR>:set makeprg=c:\immob8\tools\MAKE1FILE_NOUEDIT.BAT\ %<CR>:make<CR>:rightb copen<CR>
nmap <silent>c0 :w<CR>:call setloclist(0, [])<CR>:set makeprg=c:\immob8\tools\compile_i8_vim.exe\ %<CR>:make<CR>:rightb copen<CR>
nmap <silent>c1 :w<CR>:!.\tools\compile_i8_vim.exe %:t<CR>
"<CR>:set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"<CR>:call setloclist(0, [])
nmap <silent>cb :call Comment()<CR>
nmap <silent>cs :call SectionComment()<CR>
nmap <silent><F3> /<CR>
nmap <silent><F4> :cd %:p:h<CR>:call setloclist(0, [])<CR>:set grepprg=c:\immob8\tools\grep.exe<CR>:exec "grep -HnE " . shellescape(expand("<cword>")) . " %:t"<CR>:rightb copen<CR>
nmap <silent>ce :w! C:\immob8\temp_sb.cbl<CR>:call setloclist(0, [])<CR>:set makeprg=C:\immob8\tools\cobolsizer\bin\cobolsizer.exe<CR>:make --file %:t --rm-cobol-limit --no-error --detail-compute --result --separator<CR>:rightb copen<CR>
function Comment()
   :put = '      *-----------------------------------------------------------------'
   :put = '      *    '
   :put = '      *-----------------------------------------------------------------'
endfunction

function SectionComment()
   :put = '      ******************************************************************'
   :put = '      *    '
   :put = '      ******************************************************************'
endfunction

" disable ycm
"let g:loaded_youcompleteme = 1

augroup autoformat_settings
  autocmd FileType javascript,typescript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
" autocmd FileType csharp,cs AutoFormatBuffer astyle --mode=cs --style=ansi -pcHs
augroup END
