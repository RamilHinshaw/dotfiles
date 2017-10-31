"============================================================================
"  ____                 _ _   _   _ _           _                    
" |  _ \ __ _ _ __ ___ (_) | | | | (_)_ __  ___| |__   __ ___      __
" | |_) / _` | '_ ` _ \| | | | |_| | | '_ \/ __| '_ \ / _` \ \ /\ / /
" |  _ < (_| | | | | | | | | |  _  | | | | \__ \ | | | (_| |\ V  V / 
" |_| \_\__,_|_| |_| |_|_|_| |_| |_|_|_| |_|___/_| |_|\__,_| \_/\_/ 
"
"
" -----------------------
"	*Ramil Hinshaw's .vimrc
"
"	-Optimized for Web Development, Python, & C++
"============================================================================

"VIM MODE ACTIVATED! :D
set nocompatible 

" Plugins{{{
"Uses Vundle as the Plugin Manager : https://github.com/VundleVim/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ********** |  PLUGINS |  **********  

    "Color Scheme
    Plugin 'AlessandroYorba/Despacio'
    Plugin 'kudabux/vim-srcery-drk'

    " **** |  ESSENTIALS |  ****  
    Plugin 'VundleVim/Vundle.vim'
    "Plugin 'tomasr/molokai'
    "Plugin 'joshdick/onedark.vim'
    "Plugin 'crusoexia/vim-monokai'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/nerdcommenter'
    "Plugin 'OmniSharp/omnisharp-vim'
    "Plugin 'OmniSharp/omnisharp-roslyn'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-dispatch'
    Plugin 'tpope/vim-repeat'
    "Plugin 'scrooloose/syntastic'
    Plugin 'w0rp/ale'
    Plugin 'tpope/vim-surround'
    "Plugin 'valloric/youcompleteme'
    "Plugin 'easymotion/vim-easymotion'
    Plugin 'joequery/Stupid-EasyMotion'
    Plugin 'kien/ctrlp.vim'
    Plugin 'godlygeek/tabular'
    Plugin 'vim-airline/vim-airline'
    "Plugin 'vim-airline/vim-airline-themes'
    Plugin 'joeytwiddle/sexy_scroller.vim'
    Plugin 'vim-lastplace'
    Plugin 'egalpin/apt-vim'
    "Plugin 'Raimondi/delimitMate'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'Konfekt/FastFold'
    Plugin 'ervandew/supertab'

    "SnipMate stuff
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'

    "Plugin 'SirVer/ultisnips'

    
    " **** |  PYTHON |  ****  
    Plugin 'nvie/vim-flake8'
    Plugin 'tmhedberg/SimpylFold'

    " **** |  WEB DEVELOPMENT |  ****  
    "Plugin 'maksimr/vim-jsbeautify'
    Plugin 'ap/vim-css-color'
    "lugin 'pangloss/vim-javascript'
    "Plugin 'jaxbot/browserlink.vim'
    Plugin 'wookiehangover/jshint.vim'
    "Plugin 'ternjs/tern_for_vim', {'do': 'npm install'}
    Plugin  'JulesWang/css.vim',
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'othree/csscomplete.vim'
    Plugin 'https://github.com/mxw/vim-jsx'
    "Plugin 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
    "Plugin 'othree/html5.vim'
    Plugin 'mattn/emmet-vim'
    Plugin 'gregsexton/MatchTag'
    runtime macros/matchit.vim
    Plugin 'styled-components/stylelint-processor-styled-components'
    "Plugin 'stylelint/stylelint'
    "Plugin 'marciomazza/vim-brogrammer-theme'
    
"*********************************************************************
call vundle#end()           
"PLUGIN MANAGER ENDS ******************}}}
"AutoStart{{{

"Auto Close Folds on start
au BufRead * normal zM

"}}}
"Settings{{{
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
 "}}}
"Asthetics{{{
syntax enable
colorscheme despacio
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
set background=dark
set t_Co=256  " vim-monokai now only support 256 colours in terminal.
let g:airline_powerline_fonts = 1
"Used to show airline properly
set laststatus=2"

"if &term =~ '256color'
    "" Disable Background Color Erase (BCE) so that color schemes
    "" work properly when Vim is used inside tmux and GNU screen.
    "set t_ut=
"endif
"}}}

 " Sexy Scroller Configurations{{{
 :let g:SexyScroller_ScrollTime = 30
 :let g:SexyScroller_CursorTime = 2
 :let g:SexyScroller_MaxTime = 350
 :let g:SexyScroller_EasingStyle = 1
 "***********************************************************}}}
 "Easy Motion Configurations{{{
 let g:EasyMotion_do_mapping = 0 " Disable default mappings

 " Jump to anywhere you want with minimal keystrokes, with just one key binding.
 " `s{char}{label}`
 "nmap <c-f> <Plug>(easymotion-sl)

 " Turn on case insensitive feature
 let g:EasyMotion_smartcase = 1
 "*********************************************************************************}}}
"Syntastic Configurations {{{
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 0
let g:syntastic_check_on_wq = 1 
let b:syntastic_skip_checks = 0
let g:synatastic_enable_signs=1

let g:syntastic_javascript_checkers = ['jshint', 'jsl', 'eslint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_css = ['csslint']
let g:syntastic_cpp = ['gcc']
let g:syntastic_html_checkers = ['jshint', 'tidy']


 "***********************************************************}}}
"Emment{{{
let g:user_emmet_install_global = 0
"Use only in html, css files
autocmd FileType html,css,md,markdown EmmetInstall
let g:user_emmet_leader_key=','
 "}}}
"Bindings{{{
noremap H 0
noremap L $
nnoremap K <c-u>
nnoremap J <c-d>
nnoremap <c-u> <c-b>
nnoremap <c-d> <c-f>
nnoremap <c-j> J
nnoremap <c-s> s 
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
set pastetoggle=<F3> "Toggle Auto Indent on Paste

"Stupid EasyMotion
"map <C-O> <Leader><Leader>w
map <C-E> <Leader><Leader>W
map F <Leader><Leader>f

nnoremap <leader><leader>m :colorscheme molokai <Enter>

"Javascript Stuff
nnoremap ;; A;<Esc>|	"Adds ';' at end of line in normal mode
inoremap ;; <Esc>A;<Esc>|	"Adds ';' at end of line in insert mode
inoremap ;. <Esc>A.|	"Adds '.' at end of line in insert mode (and goes back insert mode)
inoremap ;i <Esc>A|	"Goes to end of line insert mode (and goes back into insert mode)
inoremap ;o <CR><Esc>O|	"When cursor in middle of horizontal HTML Block, breaks block into vertal and goes back to middle
inoremap ;O <Esc>O|	"Basically New line above current line in insert mode
inoremap ;z <Esc>zza|	"Centers text in insert mode
"autocmd FileType javascript,html,css,cpp nnoremap ;; A;<Esc>|	"Adds ';' at end of line in normal mode
"autocmd FileType javascript,html,cpp inoremap ;; <Esc>A;<Esc>|	"Adds ';' at end of line in insert mode
"autocmd FileType javascript,html,cpp inoremap ;. <Esc>A.|	"Adds '.' at end of line in insert mode (and goes back insert mode)
"autocmd FileType javascript,html,cpp inoremap ;i <Esc>A|	"Goes to end of line insert mode (and goes back into insert mode)
"autocmd FileType html,cpp inoremap ;o <CR><Esc>O |	"When cursor in middle of horizontal HTML Block, breaks block into vertal and goes back to middle

"Windows
nnoremap <S-w> <C-w>

"Copy & Paste
:inoremap <C-v> <ESC>"+pa
:vnoremap <C-c> "+y
:vnoremap <C-d> "+d

"}}}
"Ale Settings ***************************{{{
"Dont check while typing, check when on save
"let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
""let g:ale_open_list = 1
""nmap <silent> <C-[> <Plug>(ale_previous_wrap)
"nmap <silent> <C-e> <Plug>(ale_next_wrap)
"
"Annoying to press change this later!
nmap <silent> ,n <Plug>(ale_previous_wrap)
nmap <silent> ,m <Plug>(ale_next_wrap)


"enable keyboard shortcuts
"let g:tern_map_keys=1
"show argument hints
"let g:tern_show_argument_hints='on_hold'

"JSX syntax highlighting for javascript
"let g:jsx_ext_required = 0

"CSS AutoComplete
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
"}}}

"C++ Configurations{{{
augroup ft_cpp
  au!
  au FileType cpp set tabstop=4 "Professor reads it in 4"
  au FileType cpp set foldmethod=syntax
augroup END
"}}}
"Python Stuff {{{

"https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
let python_highlight_all=1  

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"project_base_dir = os.environ['VIRTUAL_ENV']
"activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"execfile(activate_this, dict(__file__=activate_this))
"EOF

"***********************************************************}}}
