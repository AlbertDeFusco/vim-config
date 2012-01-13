" Vim compiler file
" Compiler:     g77 (GNU Fortran)
" Maintainer:   Ralf Wildenhues <Ralf.Wildenhues@gmx.de>
" Last Change:  $Date: 2004/06/13 18:17:36 $
" $Revision: 1.1 $

if exists("current_compiler")
  finish
endif
let current_compiler = "fortran_gfortran"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

" Note: The errorformat assumes GNU make


CompilerSet errorformat=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
