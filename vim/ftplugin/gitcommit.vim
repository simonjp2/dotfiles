" Only do this when not yet done for this buffer
if exists('b:did_ftplugin')
    finish
endif



" =============================================================================
" BEHAVIOR
" =============================================================================
" Turn on spell check
setlocal spell
let b:undo_ftplugin = 'setlocal spell<'



" =============================================================================
" INDENTATION AND TEXT-WRAP
" =============================================================================
setlocal colorcolumn=+1     " Set visual column width at textwidth+1
setlocal colorcolumn+=71    " and 71
let b:undo_ftplugin .= '|setlocal textwidth< colorcolumn<'
