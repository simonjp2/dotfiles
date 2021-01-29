" =============================================================================
" Jason Simon sh settings
" =============================================================================

" Only do this when not yet done for this buffer
if exists('b:did_ftplugin')
    finish
endif



" =============================================================================
" Options
" =============================================================================
setlocal comments=:#        " Set comment formats
let b:undo_ftplugin = '|setlocal comments<'



" =============================================================================
" INDENTATION AND TEXT-WRAP
" =============================================================================
setlocal formatoptions-=t
setlocal textwidth=80           " wrap text at 80
setlocal colorcolumn=+1,120     " Set colorcolumn for 81 and 120
setlocal nowrap                 " Don't wrap
let b:undo_ftplugin .= '|setlocal formatoptions< setlocal'
let b:undo_ftplugin .= '|textwidth< colorcolumn<'
