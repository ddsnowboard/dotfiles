" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Color stuff
set t_Co=256 
colorscheme distinguished
" This makes vim transparent like the rest of the terminal
" hi Normal ctermbg=none

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " Teach vim what racket files are
  au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" automatically save on Ctrl-Z
set autowrite
" \= reformats the whole file
nnoremap <Leader>= mzgg=G`z

" don't suggest java compiled class files to open
set wildignore=*.class

" load plugins
execute pathogen#infect()


set lazyredraw " this speeds up macros by not redrawing while we're doing them

" Sometimes, lines are long. This makes movement work right, while also
" allowing for the fancy number modifiers to keep working right. 
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" This makes it show me line numbers relative to the one I'm at so I can 
" actually use the multiplier settings (eg, 5j)
set number
set relativenumber

" This lets me leave editing mode by pressing jk. If I actually need to write
" jk, I can just wait for the timer to run out. 
inoremap jk <ESC>

" Turn on fancy javascript highlighting for all js files
let g:jsx_ext_required = 0
