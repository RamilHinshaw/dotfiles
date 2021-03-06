"====================================================================================================
"
"
"  ██████╗  █████╗ ███╗   ███╗██╗██╗         ██╗  ██╗██╗███╗   ██╗███████╗██╗  ██╗ █████╗ ██╗    ██╗
"  ██╔══██╗██╔══██╗████╗ ████║██║██║         ██║  ██║██║████╗  ██║██╔════╝██║  ██║██╔══██╗██║    ██║
"  ██████╔╝███████║██╔████╔██║██║██║         ███████║██║██╔██╗ ██║███████╗███████║███████║██║ █╗ ██║
"  ██╔══██╗██╔══██║██║╚██╔╝██║██║██║         ██╔══██║██║██║╚██╗██║╚════██║██╔══██║██╔══██║██║███╗██║
"  ██║  ██║██║  ██║██║ ╚═╝ ██║██║███████╗    ██║  ██║██║██║ ╚████║███████║██║  ██║██║  ██║╚███╔███╔╝
"  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝    ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝
"
"
" ---------------------------------------
"	*Ramil Hinshaw's .vimrc |V2|
"	Website:  www.RamilHinshaw.com
"	GitHub:   www.github.com/RamilHinshaw
"	Twitter:  www.twitter.com/RamilHinshaw
"
"	-Optimized for C, C++, Web, & Python Development
"====================================================================================================

"VIM MODE ACTIVATED! :D
set nocompatible 

" Plugins {{{
"Uses Vundle as the Plugin Manager : https://github.com/VundleVim/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ********** |  PLUGINS |  **********  
  	Plugin 'VundleVim/Vundle.vim'


    " **** |  COLOR SCHEME |  ****  
    Plugin 'joshdick/onedark.vim'
    Plugin 'arcticicestudio/nord-vim'
    "Plugin 'RamilHinshaw/frostmint' "My Color Scheme


    " **** |  ESSENTIALS |  ****  
    
    Plugin 'w0rp/ale' 

    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'ap/vim-buftabline'

    " The Almighty TimPop
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-surround'

    Plugin 'joequery/Stupid-EasyMotion'
    Plugin 'vim-airline/vim-airline'
    Plugin 'joeytwiddle/sexy_scroller.vim'
    Plugin 'vim-lastplace'
    Plugin 'kien/ctrlp.vim'
    "Plugin 'shougo/neosnippet'
    Plugin 'ervandew/supertab'


    "SnipMate stuff
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'


    " **** | C & C++ | ****
    " INSTALL clang, cppcheck   | from repo
    Plugin 'richq/cmake-lint'
    Plugin 'octol/vim-cpp-enhanced-highlight'
    Plugin 'vim-scripts/a.vim' "Switch between .hpp & .cpp fast with :a


    " **** |  GIT |  ****  
    Plugin 'mhinz/vim-signify'
    Plugin 'jreybert/vimagit'

    
    " **** |  PYTHON |  ****  
    " Plugin 'hhatto/autopep8'
    " NOTHING HERE YET
 

    " **** |  WEB DEVELOPMENT |  ****  
    "Plugin 'maksimr/vim-jsbeautify'
    Plugin 'ap/vim-css-color'
    "lugin 'pangloss/vim-javascript'
    "Plugin 'jaxbot/browserlink.vim'
    "Plugin 'wookiehangover/jshint.vim'
    "Plugin 'ternjs/tern_for_vim', {'do': 'npm install'}
    "Plugin  'JulesWang/css.vim',
    "Plugin 'hail2u/vim-css3-syntax'
    "Plugin 'othree/csscomplete.vim'
    "Plugin 'https://github.com/mxw/vim-jsx'
    "Plugin 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
    "Plugin 'othree/html5.vim'
    Plugin 'mattn/emmet-vim'
    "Plugin 'gregsexton/MatchTag'
    "Plugin macros/matchit.vim
    "Plugin 'styled-components/stylelint-processor-styled-components'
    "Plugin 'stylelint/stylelint'

    
"*********************************************************************
call vundle#end()           
"PLUGIN MANAGER ENDS ******************}}}
" AutoStart {{{

"Auto Close Folds on start
au BufRead * normal zM

 "***********************************************************}}}
" Settings {{{
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Disable Auto Comments
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
setlocal smartindent 

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and
set timeoutlen=200  "Hotkey wait time for combined hotkeys
set ttimeoutlen=200

" Numbers the lines
set relativenumber
set number

"set hlsearch
set foldmethod=marker
set foldlevel=99
set history=10000

"Buffers
set hidden
 "}}}
" Asthetics {{{
syntax enable
set t_Co=256 "Enable 256 Colors, set before scheme
set background=dark
let g:onedark_termcolors=256

"colorscheme onedark
colorscheme frostmint
"colorscheme despacio
"
let g:airline_powerline_fonts = 1
"Used to show airline properly
set laststatus=2"
set mouse=a

"if &term =~ '256color'
    "" Disable Background Color Erase (BCE) so that color schemes
    "" work properly when Vim is used inside tmux and GNU screen.
    "set t_ut=
"endif
"}}}
 " Sexy Scroller Configurations {{{
 :let g:SexyScroller_ScrollTime = 30
 :let g:SexyScroller_CursorTime = 2
 :let g:SexyScroller_MaxTime = 350
 :let g:SexyScroller_EasingStyle = 1
 "***********************************************************}}}
 " Easy Motion Configurations {{{
 let g:EasyMotion_do_mapping = 0 " Disable default mappings

 " Jump to anywhere you want with minimal keystrokes, with just one key binding.
 " `s{char}{label}`
 "nmap <c-f> <Plug>(easymotion-sl)

 " Turn on case insensitive feature
 let g:EasyMotion_smartcase = 1
 "*********************************************************************************}}}
" Emment {{{

let g:user_emmet_install_global = 0
"Use only in html, css files
autocmd FileType html,css,md,markdown EmmetInstall
let g:user_emmet_leader_key=','

 "*************************************************************}}}
" Bindings {{{

noremap H 0
noremap L $
nnoremap K <c-u>
nnoremap J <c-d>
nnoremap <c-u> <c-b>
nnoremap <c-d> <c-f>
nnoremap <c-j> J
nnoremap <c-s> s 

"set hidden
"nnoremap <Left> :bprev<CR>
"nnoremap <Right> :bnext<CR>

"Switch Buffers
map <S-Left> :bprev<CR>
map <S-Right> :bnext<CR>


map <C-n> :NERDTreeToggle<CR>

"Comment Toggle
nmap <C-x> <Leader>c<space>  
"Change to sexy comment block when in visual mode (Nicer with multiple selection)
vmap <C-x> <Leader>cs<space>  

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Toggle Spacing
nnoremap <space> za 
set pastetoggle=<F4> "Toggle Auto Indent on Paste

"Stupid EasyMotion
"map <C-O> <Leader><Leader>w
map <C-E> <Leader><Leader>W
map F <Leader><Leader>f

nnoremap <leader><leader>m :colorscheme default <Enter>

"Handy Semicolon Functions
nnoremap ;; A;<Esc>|	"Adds ';' at end of line in normal mode
inoremap ;; <Esc>A;<Esc>|	"Adds ';' at end of line in insert mode
inoremap ;. <Esc>A.|	"Adds '.' at end of line in insert mode (and goes back insert mode)
inoremap ;i <Esc>A|	"Goes to end of line insert mode (and goes back into insert mode)
inoremap ;o <CR><Esc>O|	"When cursor in middle of horizontal HTML Block, breaks block into vertal and goes back to middle
inoremap ;O <Esc>O|	"Basically New line above current line in insert mode
inoremap ;z <Esc>zza|	"Centers text in insert mode

"Javascript Stuff
"autocmd FileType javascript,html,css,cpp nnoremap ;; A;<Esc>|	"Adds ';' at end of line in normal mode
"autocmd FileType javascript,html,cpp inoremap ;; <Esc>A;<Esc>|	"Adds ';' at end of line in insert mode
"autocmd FileType javascript,html,cpp inoremap ;. <Esc>A.|	"Adds '.' at end of line in insert mode (and goes back insert mode)
"autocmd FileType javascript,html,cpp inoremap ;i <Esc>A|	"Goes to end of line insert mode (and goes back into insert mode)
"autocmd FileType html,cpp inoremap ;o <CR><Esc>O |	"When cursor in middle of horizontal HTML Block, breaks block into vertal and goes back to middle

"Move Window Panes
nnoremap <S-w> <C-w>

"Copy & Paste
:inoremap <C-v> <ESC>"+pa
:vnoremap <C-c> "+y
:vnoremap <C-d> "+d

"If I forget sudo
cmap w!! w !sudo tee % >/dev/null

"Plugin Bindings
nnoremap <S-p> :CtrlPBuffer<CR> | "Search within Buffers

"*************************************************************************************************************************}}}
" C++ Configurations {{{
augroup ft_cpp
  au!
  au FileType cpp set tabstop=4 
  au FileType cpp set foldmethod=syntax
augroup END
"***********************************************************}}}
"  ALE {{{

" Enable completion where available.
let g:ale_completion_enabled = 1

" KeyBinds
map <F2> :ALEGoToDefinition<CR>
map <F3> :ALEFindReferences<CR>

" Jump to errors
nmap <silent> <C-Right> <Plug>(ale_previous_wrap)
nmap <silent> <C-Left> <Plug>(ale_next_wrap)

" Default
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Show 5 lines of errors (default: 10)
"let g:ale_list_window_size = 5





"************************************************************}}}
" GUIDE  "{{{

"Simple guide for myself on how to use my vim configuration file.


  "ALE - linting, completion, references, goToDefinition, prettyfy, etc
  "https://github.com/w0rp/ale#usage-linting

  "Comment Toggle - Ctrl-X

  "WIP

  "press zf on highlited block to turn into foldable block












"************************************************************}}}
