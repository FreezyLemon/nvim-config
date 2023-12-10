scriptencoding utf-8

" Always use clipboard for all delete, yank, change, put operation
" See https://stackoverflow.com/q/30691466/6064933
if !empty(provider#clipboard#Executable())
  set clipboard+=unnamedplus
endif

" Disable swapfile, this can cause data loss if the editor crashes
" Re-enable if this is a problem
set noswapfile

" Ignore the following files/folders when globbing:
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
" TODO: Reevaluate whether I want this:
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignorecase " ignore file and dir name cases in cmd completion

" General tab settings
set tabstop=2     " Visual spaces per TAB
set softtabstop=2 " Spaces per TAB when editing
set shiftwidth=2  " Spaces used for autoindent
set expandtab     " Expand TAB to spaces

" Additional bracket-like characters to match
set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

set number " Show only absolute line number

" Ignore casing in general, but become case-sensitive when uppercase is
" present
set ignorecase smartcase

set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1

" Break line at predefined characters
set linebreak
" Show soft linebreak character
set showbreak=↪

" TODO: Figure out what this does
" set wildmode=list:longest

" Minimum lines to keep above/below cursor when scrolling
set scrolloff=3

" Mouse settings
set mouse=nic
set mousemodel=popup
set mousescroll=ver:1,hor:0

" Don't show mode, plugins (statusline) will do it
set noshowmode

" Fileformat for new files
set fileformats=unix

set confirm " Confirmation for unsaved & read-only files
set visualbell noerrorbells " No visual & errorbells
set history=500

" Show hostname, full filepath and last-mod time in window title
set title
set titlestring=
set titlestring=%{utils#Get_titlestr()}

set undofile " Persist undo even after closing file
set shortmess+=c " No "match X of Y" during auto-completion
" TODO: Consider set shortmess+=S 
set shortmess+=I " Disable intro message (:intro)

set completeopt+=menuone " Always show completion window, even with only one match
set completeopt-=preview " No preview window

set pumheight=10 " Maximum number of items in popup menu
set pumblend=10 " Pseudo transparency of popup menu
set winblend=0 " Pseudo transparency of floating windows

set spelllang=en,de " Spell languages
set spellsuggest+=5 " Maximum number of spell suggestions

set formatoptions+=mM " Correct multibyte char handling (CJK etc.)

set synmaxcol=250 " Don't highlight syntax for more than X columns
set nostartofline

" Use ripgrep if available
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

" Use true color
set termguicolors

" various diff options
set diffopt=
set diffopt+=vertical " show diff in vertical position
set diffopt+=filler " show filler for deleted lines
set diffopt+=closeoff " turn off diff when one file window is closed
set diffopt+=context:3 " context for diff
set diffopt+=internal,indent-heuristic,algorithm:histogram
set diffopt+=linematch:60

set nowrap " no linewrap
set noruler

