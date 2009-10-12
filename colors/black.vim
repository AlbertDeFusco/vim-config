" Remove all existing highlighting and set the defaults.
hi clear

 " Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "black"
set bg=light
highlight Normal   guifg=white guibg=black  
highlight Search guibg=Green guifg=Black 
"highlight Comment cterm=none ctermfg=Blue ctermbg=none
"highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green gui=none guifg=bg guibg=Green
"highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=none ctermfg=bg ctermbg=Yellow gui=none guifg=bg guibg=Yellow
"highlight DiffText cterm=none ctermfg=bg ctermbg=Magenta gui=none guifg=bg guibg=Magenta 

