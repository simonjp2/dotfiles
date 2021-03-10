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
