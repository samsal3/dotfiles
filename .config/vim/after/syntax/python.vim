" Color None/True/False as constants instead of built-in functions.
" Vim's python.vim puts them in pythonBuiltin (with len, int, ...); a keyword
" defined later wins, so this only moves these three words.
syn keyword pythonConstant False True None
hi def link pythonConstant Constant
