if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	autocmd BufNewFile,BufRead *.src set filetype=gmssrc
	   "\ set filetype=fortran |
	   "\ let fortran_dialect = "f77" |
	   "\ let fortran_do_enddo=1 |
	   "\ let fortran_fixed_source=1 |
	   "\ set sw=3 
	autocmd BufNewFile,BufRead *.code set filetype=fortran
	autocmd BufNewFile,BufRead *.inp set filetype=inp2
	autocmd BufNewFile,BufRead *.dat set filetype=inp2
	autocmd BufNewFile,BufRead *.irc set filetype=inp2
	autocmd BufNewFile,BufRead *.trj set filetype=inp2
	autocmd BufNewFile,BufRead *.efp set filetype=inp2
	autocmd BufNewFile,BufRead *.gamess set filetype=gamess
	autocmd BufNewFile,BufRead *.gnuplot set filetype=gnuplot
	autocmd BufNewFile,BufRead *.gp set filetype=gnuplot
	autocmd BufNewFile,BufRead pentadactyl-localhost.tmp,pentadactyl-albertdefuscoworkbook.local.tmp,pentadactyl-defusco.msg.chem.iastate.edu.tmp,vimperator-localhost.tmp,vimperator-albertdefuscoworkbook.local*.tmp,*ResearchWiki*,*ResearchWiki.safari,*.researchwiki set filetype=mediawiki |
	                         \ set foldmethod=syntax
	autocmd BufNewFile,BufRead bash-fc-[0-9]* set filetype=sh
	autocmd BufNewFile,BufRead /private/var/log/system.log* set filetype=messages
	autocmd BufNewFile,BufRead /private/var/log/secure.log* set filetype=messages
	autocmd BufNewFile,BufRead /private/var/log/apache2/*_log set filetype=messages
	autocmd BufNewFile,BufRead /opt/local/apache2/logs/*_log set filetype=messages
	autocmd BufNewFile,BufRead /var/log/system.log* set filetype=messages
	autocmd BufNewFile,BufRead /var/log/secure.log* set filetype=messages
	autocmd BufNewFile,BufRead /var/folders/*/sql* set filetype=sql
	autocmd BufNewFile,BufRead Makefile.inc set filetype=make
	" Git
	autocmd BufNewFile,BufRead *.git/COMMIT_EDITMSG    set filetype=gitcommit
	autocmd BufNewFile,BufRead *.git/config,.gitconfig set filetype=gitconfig
	autocmd BufNewFile,BufRead git-rebase-todo         set filetype=gitrebase
	autocmd BufNewFile,BufRead .msg.[0-9]*
				\ if getline(1) =~ '^From.*# This line is ignored.$' |
				\   set filetype=gitsendemail |
				\ endif
	autocmd BufNewFile,BufRead *.git/**
				\ if getline(1) =~ '^\x\{40\}\>\|^ref: ' |
				\   set filetype=git |
				\ endif
	autocmd BufNewFile,BufRead *.gitmodules set filetype=gitconfig
augroup END

