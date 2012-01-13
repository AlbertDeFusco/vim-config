" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if &term =~ "xterm"
  if has("terminfo")
    set t_Co=8
    set t_Sf=[3%p1%dm
    set t_Sb=[4%p1%dm
  else
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  endif
endif


set diffopt+=iwhite
set diffopt+=vertical
"case-insensitive search
"set ic
"bash-like tab completion
set wildmode=longest:full
set wildmenu

"set foldmethod=syntax
"nmap <F3> :runtime! macros/less.vim<cr>
"map <F2> "zyw:exe "h ".@z.""<cr>
"command! RunGamess :! echo "hello"
"function Rungamess(version)
	"cd %:h
	
"map <F2> :cd %:h<cr>:Tail %:r.gamess<cr>
map <F2> :h gamess<cr>
"nmap <F4> /$VEC<cr>zf/END<cr>
set printoptions=paper:letter
"let g:Tex_ViewRule_pdf = 'Preview'
let g:Tex_ViewRule_pdf = 'Skim'
let g:Tex_ViewRule_dvi = 'Skim'
let g:Tex_ViewRule_ps = 'Skim'
let g:Tex_MultipleCompileFormats = 'pdf,dvi,ps'
"let g:Tex_CompileRule_pdf = 'pdfatex -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_Folding=0
set shcf=-cl
set linebreak
set encoding=utf-8

"set smarttab
set autoread
set smartindent
"set autoindent
set mousefocus
runtime macros/matchit.vim
set backupcopy=yes
set nobackup
"set backupcopy+=breaksymlink

hi Comment guifg=#0033ff
let g:git_branch_status_head_current=1
let g:git_branch_status_around=""
let g:git_branch_status_text=""
let g:git_branch_status_nogit=""
"set rulerformat=%17(%l,%c%V%=%5(%P%)%)
set rulerformat=%27(%{GitBranchInfoString()}%(%17(%l,%c%V%=%5(%P%)%)%)%)
set efm=%E%f:%l.%c:,%E\ In\ file\ %f:%l,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#

set shiftwidth=2

if has("unix")
  set background=light
endif
