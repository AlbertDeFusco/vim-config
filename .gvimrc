colorscheme black
set visualbell

if has("gui_running")
	set guioptions=egmrt
endif

set lines=35
set columns=100
set guicursor=a:hor10-blinkon0
if has("macunix")
  set guifont=Monaco:h12
else
  set guifont=Monaco\ 12
endif
