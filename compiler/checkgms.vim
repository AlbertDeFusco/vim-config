" Vim compiler file
" Compiler:     g77 (GNU Fortran)
" Maintainer:   Ralf Wildenhues <Ralf.Wildenhues@gmx.de>
" Last Change:  $Date: 2004/06/13 18:17:36 $
" $Revision: 1.1 $

if exists("current_compiler")
  finish
endif
let current_compiler = "checkgms"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>  
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=checkgms\ %
CompilerSet errorformat=Error\ near\ line\ %l\ col\ %c\ file\ %f:\ %m
	"\%E\ In\ file\ %f:%l,
	"\%C\ %p%*[1],
	"\%CError:\ %m,
	"\%Z

let &cpo = s:cpo_save
unlet s:cpo_save
