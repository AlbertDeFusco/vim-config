" Vim syntax file
" Language:	GAMESS Input file
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
syn region inpComment start="[!]\|\(^\?\!\(\$|\s\$\)\)." end="$"
syn match inpComment "^---.*"
syn match inpDeck "\(^\s\$[a-z0-9]*\|\$end\)" contains=inpError
syn match inpAtom display "^[a-z0-9]\{1,10\}\s*-\?[0-9]" contains=inpNumber
syn match inpError "^\$[a-z0-9]*"
syn match inpError excludenl "^.\{81,}$"lc=80
syn match inpOperator "[=]"
"syn match inpNumber display "\<-\?\d\+\(_\a\w*\)\=\>"
"syn match inpNumber display "\<-\?\d\+\.\d\+\(e[-+]\=\d\+\)\=\(_\a\w*\)\=\>"
"Numbers of various sorts
" Integers
syn match inpNumber	display "\<\d\+\(_\a\w*\)\=\>"
" floating point number, without a decimal point
syn match inpNumber	display	"\<\d\+[deq][-+]\=\d\+\(_\a\w*\)\=\>"
" floating point number, starting with a decimal point
syn match inpNumber	display	"\.\d\+\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
" floating point number, no digits after decimal
syn match inpNumber	display	"\<\d\+\.\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
" floating point number, D or Q exponents
syn match inpNumber	display	"\<\d\+\.\d\+\([dq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
" floating point number
syn match inpNumber	display	"\<\d\+\.\d\+\(e[-+]\=\d\+\)\=\(_\a\w*\)\=\>"
" Numbers in formats
syn match inpNumber	display	"\d*f\d\+\.\d\+"
syn match inpNumber	display	"\d*e[sn]\=\d\+\.\d\+\(e\d+\>\)\="
syn match inpNumber	display	"\d*\(d\|q\|g\)\d\+\.\d\+\(e\d+\)\="
syn match inpNumber	display	"\d\+x\>"
syn match inpKeyword display "=\([a-z0-9-+]*\)" contains=inpNumber,inpOperator
syn match inpEfrag display "^\s[a-z]*poles"
syn match inpEfrag display "^\sstop"
syn match inpBoolean "\.\s*\(true\|false\|t\|f\)\s*\."
syn match inpSym "^c\(1\|s\|i\)"
syn match inpSym "^c\(nh\|nv\|n\)\s*[0-9]" contains=inpNumber
syn match inpSym "^d\(nh\|nd\|n\)\s*[0-9]" contains=inpNumber
syn match inpSym "^s2n\s*[0-9]" contains=inpNumber
syn match inpSym "^\(t\|th\|td\|o?!\(\s*[0-9]\)\|oh\)" contains=inpNumber
syn region inpData start="^\s\$data" end="\$end" transparent extend keepend contains=inpAtom,inpDeck,inpSym,inpError,inpBoolean,inpNumber
syn region inpEfrag start="^\s\$efrag" end="\$end" transparent extend keepend contains=inpAtom,inpDeck,inpKeyword,inpNumber,inpError,inpBoolean
syn region inpVec start="^\s\$vec" end="\$end" extend fold transparent keepend contains=inpDeck,inpNumber,inpError,inpBoolean
syn region inpCEDAT start="^\s\$cedata" end="\$end" extend fold transparent keepend contains=inpDeck,inpNumber,inpError,inpBoolean
syn region inpMD start="^\s\$md" end="\$end" extend fold transparent keepend contains=inpAtom,inpDeck,inpKeyword,inpNumber,inpError,inpBoolean,inpComment
syn region inpFragname start="^\s\$[a-z0-9]*\s*\nEFP\sDATA" end="\$end" extend fold transparent keepend contains=inpDeck,inpNumber,inpError,inpBoolean

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_inp_syn_inits")
	if version < 508
		let did_inp_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink inpComment	Comment
	HiLink inpDeck		Type
	HiLink inpError		Error
	HiLink inpVec		Folded
"	HiLink inpOperator	Operator
	HiLink inpKeyword	Keyword
	HiLink inpSym		Keyword
	HiLink inpEfrag		Keyword
	HiLink inpNumber	Number
	HiLink inpBoolean	Function
	HiLink inpAtom		Identifier

	delcommand HiLink
endif

" Input abbreviations
"iab guess $GUESS GUESS=MOREAD NORB= PRTMO=.F. $END<ESC>7ba


let b:current_syntax = "inp"

