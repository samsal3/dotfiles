" Author: Sergio Samuel Saldaña Flores
" Based on Jonathan Blow's emacs color theme

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

hi Normal            guibg=#041818  guifg=#D3B58D gui=NONE ctermbg=NONE ctermfg=180 cterm=NONE
hi NonText            guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=fg cterm=NONE
hi StatusLine         guibg=#0C4848  guifg=#E5E5E5 gui=NONE ctermbg=23 ctermfg=254 cterm=NONE
hi StatusLineNC       guibg=#062424  guifg=#E5E5E5 gui=NONE ctermbg=234 ctermfg=254 cterm=NONE
hi StatusTermLine     guibg=#0C4848  guifg=#E5E5E5 gui=NONE ctermbg=23 ctermfg=254 cterm=NONE
hi StatusTermLineNC   guibg=#062424  guifg=#E5E5E5 gui=NONE ctermbg=234 ctermfg=254 cterm=NONE
hi WildMenu           guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=19 ctermfg=254 cterm=NONE
hi VertSplit          guibg=#062424  guifg=#E5E5E5 gui=NONE ctermbg=234 ctermfg=254 cterm=NONE
hi Folded             guibg=bg       guifg=#00A600 gui=NONE ctermbg=NONE ctermfg=34 cterm=NONE
hi FoldColumn         guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=34 cterm=NONE
hi Conceal            guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=fg cterm=NONE
hi LineNr             guibg=bg       guifg=#454545 gui=NONE ctermbg=NONE ctermfg=238 cterm=NONE
hi Visual             guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=19 ctermfg=254 cterm=NONE
hi IncSearch          guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=19 ctermfg=254 cterm=NONE
hi CurSearch          guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=19 ctermfg=254 cterm=NONE
hi QuickFixLine       guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=19 ctermfg=254 cterm=NONE
hi CursorLine         guibg=#807F7F  guifg=#E5E5E5 gui=NONE ctermbg=244 ctermfg=254 cterm=NONE
hi Pmenu              guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=fg cterm=NONE
hi PmenuSel           guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=19 ctermfg=254 cterm=NONE
hi Statement          guibg=bg       guifg=#E5E5E5 gui=NONE ctermbg=NONE ctermfg=254 cterm=NONE
hi Identifier         guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=fg cterm=NONE
hi Type               guibg=bg       guifg=#E5E5E5 gui=NONE ctermbg=NONE ctermfg=254 cterm=NONE
hi PreProc            guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=fg cterm=NONE
hi Constant           guibg=bg       guifg=#D7FFD7 gui=NONE ctermbg=NONE ctermfg=194 cterm=NONE
hi Character          guibg=bg       guifg=#D7FFD7 gui=NONE ctermbg=NONE ctermfg=194 cterm=NONE
hi String             guibg=bg       guifg=#D7FFAF gui=NONE ctermbg=NONE ctermfg=193 cterm=NONE
hi SpecialChar        guibg=bg       guifg=#D7FFD7 gui=NONE ctermbg=NONE ctermfg=194 cterm=NONE
hi Comment            guibg=bg       guifg=#00A600 gui=NONE ctermbg=NONE ctermfg=34 cterm=NONE
hi MoreMsg            guibg=bg       guifg=#00A600 gui=NONE ctermbg=NONE ctermfg=34 cterm=NONE
hi Question           guibg=bg       guifg=#00A600 gui=NONE ctermbg=NONE ctermfg=34 cterm=NONE
hi Special            guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=fg cterm=NONE
hi SpecialKey         guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=fg cterm=NONE
hi NonText            guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=fg cterm=NONE
hi Directory          guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=fg cterm=NONE
hi Title              guibg=bg       guifg=fg      gui=NONE ctermbg=NONE ctermfg=fg cterm=NONE
hi Todo               guibg=bg       guifg=#00A600 gui=NONE ctermbg=NONE ctermfg=34 cterm=NONE
hi Error              guibg=#990000  guifg=#E5E5E5 gui=NONE ctermbg=88 ctermfg=254 cterm=NONE
hi WarningMsg         guibg=#990000  guifg=#E5E5E5 gui=NONE ctermbg=88 ctermfg=254 cterm=NONE
hi SpellLocal         guibg=#990000  guifg=#E5E5E5 gui=NONE ctermbg=88 ctermfg=254 cterm=NONE
hi SpellRare          guibg=#990000  guifg=#E5E5E5 gui=NONE ctermbg=88 ctermfg=254 cterm=NONE
hi SpellCap           guibg=#990000  guifg=#E5E5E5 gui=NONE ctermbg=88 ctermfg=254 cterm=NONE

let g:colors_name = "verde"


