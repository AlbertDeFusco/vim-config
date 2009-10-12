" Vim syntax file
" Language:	GAMESS Output file
" Maintainer:	Albert DeFusco
" URL:		
" Last Change:	

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syn case ignore
"syn region gmsProg start="^\s\{1,\}-.*\n" end="^\s\{1,\}-.*\n"
syn region gmsRHF start="\(-\{12\}\)\n\s*EIGENVECTORS\n\s*\(-\{12\}\)\n" end="end\sof\srhf\scalculation" extend fold transparent keepend
"syn region gmsMO start="\(-\{18\}\)\n\s*molecular\sorbitals\n\s*\(-\{18\}\)\n" end="[0-9]\n" extend fold transparent keepend 
syn region gmsBASIS start="atomic\sbasis\sset" end="total\snumber\sof\sbasis\sset\sshells" extend fold transparent keepend
syn match gmsDone "^\s\{1,\}\(\.\)\{3,\}\s\(.*\)\s\(\.\)\{3,6\}"
syn match gmsDeck "\$[a-z0-9]*"
syn match gmsTitle "-\{5,\}"
syn match gmsTitle "*\{5,\}"
"syn match gmsOperator "[=]"
"syn match gmsKeyword display "\([a-z0-9]*\)\s?=" contains=gmsOperator
"syn match gmsNumber display "\<\d\+\.\d\+\(e[-+]\=\d\+\)\=\(_\a\w*\)\=\>"
"syn match gmsNumber display "\<\d\+\(_\a\w*\)\=\>"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gamess_syn_inits")
	if version < 508
		let did_inp_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	"HiLink inpComment	Comment
	HiLink gmsDeck		Type
	"HiLink inpError		Error
	"HiLink inpVec		Folded
	"HiLink gmsOperator	Operator
	HiLink gmsDone		Function
	"HiLink gmsKeyword	Keyword
	HiLink gmsTitle 	Keyword
	HiLink gmsRHF		Folded
	HiLink gmsBASIS 	Folded
	HiLink gmsMO	 	Folded
	"HiLink gmsProg		Type
	"HiLink gmsNumber	Number
	"HiLink inpBoolean	Function
	"HiLink inpAtom		Identifier

	delcommand HiLink
endif

let b:current_syntax = "gamess"
