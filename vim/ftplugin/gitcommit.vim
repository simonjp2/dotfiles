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
setlocal textwidth=72       " Wrap text at 72 characters
setlocal colorcolumn=+1     " Set visual column width at textwidth+1
setlocal colorcolumn+=51    " and 51
let b:undo_ftplugin .= '|setlocal textwidth< colorcolumn<'
