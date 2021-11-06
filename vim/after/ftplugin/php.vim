" =============================================================================
" Jason Simon php settings
" -----------------------------------------------------------------------------
"  Override settings in default php ftplugin
" =============================================================================

" =============================================================================
" Options
" =============================================================================
setlocal commentstring=//\ %s              " Set comment template
let b:undo_ftplugin = '|setlocal commentstring<'

set shiftround
set noexpandtab           " Use tabs
set shiftwidth=4        " Indent with 4 spaces
set softtabstop=4       " Insert 4 spaces with tab key
set tabstop=4
set smarttab            " At start of line <TAB> inserts shift width spaces,
                        " <BS> deletes shift width spaces
let b:undo_ftplugin .= '|setlocal shiftround< noexpandtab< shiftwidth< softtabstop< tabstop< smarttab<'
