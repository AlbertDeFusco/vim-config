if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	autocmd BufNewFile,BufRead *.src 
	   \ set filetype=fortran |
	   \ let fortran_dialect = "f77" |
	   \ let fortran_do_enddo=1 |
	   \ let fortran_fixed_source=1 |
	   \ set sw=3 
	autocmd BufNewFile,BufRead *.code set filetype=fortran
	autocmd BufNewFile,BufRead *.inp set filetype=inp2
	autocmd BufNewFile,BufRead *.dat set filetype=inp2
	autocmd BufNewFile,BufRead *.irc set filetype=inp2
	autocmd BufNewFile,BufRead *.trj set filetype=inp2
	autocmd BufNewFile,BufRead *.efp set filetype=inp2
	autocmd BufNewFile,BufRead *.gamess set filetype=gamess
	autocmd BufNewFile,BufRead *.gnuplot set filetype=gnuplot
	autocmd BufNewFile,BufRead *.gp set filetype=gnuplot
	autocmd BufNewFile,BufRead *ResearchWiki.safari set filetype=mediawiki
	autocmd BufNewFile,BufRead *.researchwiki set filetype=mediawiki
	autocmd BufNewFile,BufRead bash-fc-[0-9]* set filetype=sh
	autocmd BufNewFile,BufRead /private/var/log/system.log* set filetype=messages
	autocmd BufNewFile,BufRead /private/var/log/apache2/*_log set filetype=messages
	autocmd BufNewFile,BufRead /var/log/system.log* set filetype=messages
	autocmd BufNewFile,BufRead /var/folders/*/sql* set filetype=sql
	autocmd BufNewFile,BufRead *.gitmodules set filetype=gitconfig
augroup END

