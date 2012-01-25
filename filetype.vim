if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	au  BufNewFile,BufReadPost *.lmp set ft=lammps
	au  BufNewFile,BufReadPost *.lmpdat set ft=lammps
	au  BufNewFile,BufReadPost *.lammps set ft=lammps

	autocmd BufNewFile,BufRead *.src set ft=gmssrc 
	autocmd BufNewFile,BufRead *.code set filetype=fortran
	autocmd BufNewFile,BufRead *.cocof set filetype=fortran
	autocmd BufNewFile,BufRead *.coco set filetype=fortran
	autocmd BufNewFile,BufRead *.inp set filetype=inp2
	autocmd BufNewFile,BufRead *.gamin set filetype=inp2
	autocmd BufNewFile,BufRead *.dat set filetype=inp2
	autocmd BufNewFile,BufRead *.irc set filetype=inp2
	autocmd BufNewFile,BufRead *.trj set filetype=inp2
	autocmd BufNewFile,BufRead *.efp set filetype=inp2
	autocmd BufNewFile,BufRead *.gamess set filetype=gamess
	autocmd BufNewFile,BufRead *.gamout set filetype=gamess
	autocmd BufNewFile,BufRead *.gnuplot set filetype=gnuplot
	autocmd BufNewFile,BufRead *.gp set filetype=gnuplot
	autocmd BufNewFile,BufRead vimperator-*.tmp set filetype=mediawiki 
	autocmd BufNewFile,BufRead bash-fc-[0-9]* set filetype=sh
	autocmd BufNewFile,BufRead /private/var/log/system.log* set filetype=messages
	autocmd BufNewFile,BufRead /private/var/log/secure.log* set filetype=messages
	autocmd BufNewFile,BufRead /private/var/log/apache2/*_log set filetype=messages
	autocmd BufNewFile,BufRead /opt/local/apache2/logs/*_log set filetype=messages
	autocmd BufNewFile,BufRead /var/log/system.log* set filetype=messages
	autocmd BufNewFile,BufRead /var/log/secure.log* set filetype=messages
	autocmd BufNewFile,BufRead /var/folders/*/sql* set filetype=sql
	autocmd BufNewFile,BufRead Makefile.inc set filetype=make
	autocmd BufNewFile,BufRead *.f90 let b:fortran_do_enddo=1
	" Git
	"autocmd BufNewFile,BufRead *.git/COMMIT_EDITMSG    set filetype=gitcommit
	"autocmd BufNewFile,BufRead *.git/config,.gitconfig set filetype=gitconfig
	"autocmd BufNewFile,BufRead git-rebase-todo         set filetype=gitrebase
	"autocmd BufNewFile,BufRead .msg.[0-9]*
	"			\ if getline(1) =~ '^From.*# This line is ignored.$' |
	"			\   set filetype=gitsendemail |
	"			\ endif
	"autocmd BufNewFile,BufRead *.git/**
	"			\ if getline(1) =~ '^\x\{40\}\>\|^ref: ' |
	"			\   set filetype=git |
	"			\ endif
	"autocmd BufNewFile,BufRead *.gitmodules set filetype=gitconfig
augroup END

