" Only do this when not yet done for this buffer
if exists('b:did_ftplugin')
    finish
endif



" =============================================================================
" BEHAVIOR
" =============================================================================

setlocal spell              " Turn on spell check
let b:undo_ftplugin = 'setlocal spell<'



" =============================================================================
" INDENTATION AND TEXT-WRAP
" =============================================================================
setlocal textwidth=71       " Wrap text at 72 characters
setlocal colorcolumn=+1     " Wrap text at 72 characters
setlocal colorcolumn=+51    " and 51
let b:undo_ftplugin='setlocal textwidth< colorcolumn<'
