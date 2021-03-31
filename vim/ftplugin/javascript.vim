" =============================================================================
" Jason Simon javascript settings
" =============================================================================

" Only do this when not yet done for this buffer
if exists('b:did_ftplugin')
    finish
endif



" =============================================================================
" Options
" =============================================================================

setlocal comments=sr:/*,mb:*,ex:*/,://      " Set comment formats
setlocal list                               " Show 'hidden' characters
setlocal suffixesadd+=.js
let b:undo_ftplugin = '|setlocal comments< list< suffixesadd<'

set shiftround
set noexpandtab           " Use tabs
set shiftwidth=4        " Indent with 4 spaces
set softtabstop=4       " Insert 4 spaces with tab key
set tabstop=4
set smarttab            " At start of line <TAB> inserts shift width spaces,
                        " <BS> deletes shift width spaces
let b:undo_ftplugin .= '|setlocal shiftround< noexpandtab< shiftwidth< softtabstop< tabstop< smarttab<'


" =============================================================================
" INDENTATION AND TEXT-WRAP
" =============================================================================
setlocal nowrap                             " Don't wrap lines
setlocal textwidth=80                       " Set textwidth
setlocal colorcolumn=+1,120                 " Set colorcolumn for 81 and 120
let b:undo_ftplugin ='|setlocal wrap< textwidth< colorcolumn<'



" =============================================================================
" KEY MAPPINGS
" =============================================================================
inoremap <buffer> <localleader><Tab> <C-X><C-N>
let b:undo_ftplugin .= '|iunmap <buffer> <localleader><Tab>'




function Angular_Format_Controller()
    execute "normal! i(function() {\<CR>\<ESC>f(%0Di})();\<ESC>gg"
    execute "normal! /App\<CR>dt.iangular\<CR>.module('app')\<CR>\<ESC>"
    execute "normal! f'yi'/function\<CR>ewPa \<ESC>"
    execute "normal! ?controller\<CR>f'yi'f[Pa);\<CR>\<CR>\<ESC>"
    execute "normal! pa.$inject = \<ESC>$xa];\<ESC>0o\<ESC>"
    execute "normal! gg=G"
endfunction
nnoremap <buffer> <localleader>afc :call Angular_Format_Controller()<CR>
let b:undo_ftplugin .= '|iunmap <buffer> <localleader><afc>'
