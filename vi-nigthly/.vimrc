set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/vim/bundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'dense-analysis/ale'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'
Plugin 'Quramy/tsuquyomi'

" Source the termdebug plugin
packadd termdebug
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" Identation
au BufNewFile,BufRead *.py,*.c,*.cpp,*.h,*.cc,makefile,*.rs
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.ts
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab |
	\ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

au BufNewFile,BufRead *.yml,*.json
    \ set tabstop=4 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

au BufNewFile,BufRead *.cs,*.razor
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set syntax=html |

au BufNewFile,BufRead *.rst
    \ set tabstop=3 |
    \ set softtabstop=3 |
    \ set shiftwidth=3 |

au BufNewFile,BufRead *.vimrc
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

au BufNewFile,BufRead *.desktop
	\ set autoindent |
    \ set fileformat=unix |


" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cs,*.desktop,*.rs match BadWhitespace /\s\+$/

" UTF-8 Support
set encoding=utf-8

" Aut-Complete
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntax Checking/Highlighting
let python_highlight_all=1
syntax on

" Syntax
execute pathogen#infect()
"let g:syntastic_python_checkers = ['pylint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Colors schemes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
call togglebg#map("<F5>")

" File browsing
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" NERDTree on start
" autocmd vimenter * NERDTree

" Shortcur NERDTree
map <C-n> :NERDTreeToggle<CR>

" Line numbering
set nu


" Powerline
set rtp+=/usr/share/powerline/bindings/vim/

" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256  colours)
set t_Co=256
"let g:Powerline_symbols = "fancy"
"set guifont=Sauce_Code_Powerline:h11
"set guifont=Source\ Code\ Pro\ for\ Powerline
"set fillchars+=stl:\ ,stlnc:\  

"let g:airline_powerline_fonts = 1

" Clipboard osx
set clipboard=unnamed

" Toogle bar
autocmd FileType c,cpp,cs,python nested :TagbarOpen
let g:tagbar_sort = 0
nmap <F8> :TagbarToggle<CR>

" Run for developement
" nmap <F11> :!./run.sh dev<CR>
nmap <F12> :!./run.sh<CR>
autocmd FileType c nmap <F11> :!make clean && make run<CR>
autocmd FileType cpp nmap <F11> :!make clean && make run<CR>
autocmd FileType py nmap <F11> :!./run.sh dev<CR>
autocmd FileType rust nmap <F11> :!cargo run --verbose<CR>
" Run git
nmap <F2> :!echo "Macro F2 -> git diff" && git diff<CR>
nmap <F3> :!echo "Macro F3 -> git diff --name-only" && git diff --name-only<CR>
nmap <F4> :!echo "Macro F4 -> git show --stat --oneline HEAD" && git show --stat --oneline HEAD<CR>
nmap <F5> :!echo "Macro F5 -> git show --stat --oneline HEAD^^..HEAD" && git show --stat --oneline HEAD^^..HEAD<CR>
nmap <F6> :!echo "Macro F6 -> git add %" && git add %<CR>
nmap <F9> :!git commit -m <C-R>=input('Macro F9 -> git commit -m -> insérer entre "...":')<CR>

" Remove whitespace
if !exists('*StripTrailingWhitespace')
    function! StripTrailingWhitespace()
        if !&binary && &filetype != 'diff'
            let b:win_view = winsaveview()
            silent! keepjumps keeppatterns %s/\s\+$//e
            call winrestview(b:win_view)
        endif
    endfunction
endif
command! Cls call StripTrailingWhitespace()
cnoreabbrev cls Cls
cnoreabbrev StripTrailingSpace Cls
nnoremap <Leader>s :call StripTrailingWhitespace()
nmap <F10> :cls<CR>

" Terminal debugger https://www.dannyadam.com/blog/2019/05/debugging-in-vim/
" Add mapping to load termdebug
map <C-d> :Termdebug<cr>
" Add mappings for :Step and :Over
map <S-s> :Step<cr>
map <S-§> :Over<cr>

" Goto next
map <S-g> :YcmCompleter GoTo<CR>

" TypeScript import
map <C-i> :TsuImport<CR>
let tsuquyomi_single_quote_import=1

let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")

" Support c
let g:clang_format#style_options = {
            \ "AccessModifierOffset": -4,
            \ "AllowShortIfStatementsOnASingleLine": "true",
            \ "AlwaysBreakTemplateDeclarations": "true",
            \ "Standard": "C++11",
            \ "BreakBeforeBraces": "Stroustrup"}
autocmd FileType c,cpp ClangFormatAutoEnable
autocmd FileType c,cpp setlocal equalprg=clang-format
let g:ycm_extra_conf_globlist = ['~/Code/C++/*','!~/*']
" Ale config for gtk c++ 
let g:ale_cpp_gcc_options = '-std=c++14 -Wall - < `pkg-config gtkmm-3.0 --cflags --libs`'
" linter
let g:ale_fixer = {
			\ "rust": ['cargo', 'rls', 'rustc'],
			\ }
