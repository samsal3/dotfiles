" Author: Sergio Samuel Saldaña Flores

hi clear
if exists("syntax_on")
  syntax reset
endif

" term colors

" 00: #000000
" 01: #990000
" 02: #00A600
" 04: #0000B2
" 07: #D3B58D
" 08: #000000
" 09: #0C4848
" 10: #D7FFAF
" 11: #062424
" 12: #454545
" 13: #807F7F
" 15: #E5E5E5

hi Normal             guibg=#000000  guifg=#D3B58D gui=NONE ctermbg=00 ctermfg=07 cterm=NONE
hi NonText            guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi StatusLine         guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi StatusLineNC       guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi StatusTermLine     guibg=#0C4848  guifg=#000000 gui=NONE ctermbg=09 ctermfg=15 cterm=NONE
hi StatusTermLineNC   guibg=#062424  guifg=#000000 gui=NONE ctermbg=11 ctermfg=15 cterm=NONE
hi WildMenu           guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=04 ctermfg=15 cterm=NONE
hi VertSplit          guibg=bg       guifg=bg      gui=NONE ctermbg=bg ctermfg=bg cterm=NONE
hi Folded             guibg=bg       guifg=#00A600 gui=NONE ctermbg=bg ctermfg=02 cterm=NONE
hi FoldColumn         guibg=bg       guifg=#00A600 gui=NONE ctermbg=bg ctermfg=02 cterm=NONE
hi Conceal            guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi LineNr             guibg=bg       guifg=#454545 gui=NONE ctermbg=bg ctermfg=12 cterm=NONE
hi Visual             guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=04 ctermfg=15 cterm=NONE
hi IncSearch          guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=04 ctermfg=15 cterm=NONE
hi CurSearch          guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=04 ctermfg=15 cterm=NONE
hi QuickFixLine       guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=04 ctermfg=15 cterm=NONE
hi CursorLine         guibg=#807F7F  guifg=#E5E5E5 gui=NONE ctermbg=13 ctermfg=15 cterm=NONE
hi Pmenu              guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi PmenuSel           guibg=#0000B2  guifg=#E5E5E5 gui=NONE ctermbg=04 ctermfg=15 cterm=NONE
hi Statement          guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi Identifier         guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi Type               guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi PreProc            guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi Constant           guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi Comment            guibg=bg       guifg=#00A600 gui=NONE ctermbg=bg ctermfg=02 cterm=NONE
hi MoreMsg            guibg=bg       guifg=#00A600 gui=NONE ctermbg=bg ctermfg=02 cterm=NONE
hi Question           guibg=bg       guifg=#00A600 gui=NONE ctermbg=bg ctermfg=02 cterm=NONE
hi Special            guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi SpecialKey         guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi NonText            guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi Directory          guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi Title              guibg=bg       guifg=fg      gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
hi Todo               guibg=bg       guifg=#00A600 gui=NONE ctermbg=bg ctermfg=02 cterm=NONE
hi Error              guibg=#990000  guifg=#E5E5E5 gui=NONE ctermbg=01 ctermfg=15 cterm=NONE
hi WarningMsg         guibg=#990000  guifg=#E5E5E5 gui=NONE ctermbg=01 ctermfg=15 cterm=NONE
hi SpellLocal         guibg=#990000  guifg=#E5E5E5 gui=NONE ctermbg=01 ctermfg=15 cterm=NONE
hi SpellRare          guibg=#990000  guifg=#E5E5E5 gui=NONE ctermbg=01 ctermfg=15 cterm=NONE
hi SpellCap           guibg=#990000  guifg=#E5E5E5 gui=NONE ctermbg=01 ctermfg=15 cterm=NONE

let g:colors_name = "oscuro"
