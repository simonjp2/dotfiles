" =============================================================================
" Jason Simon php settings
" =============================================================================

" Only do this when not yet done for this buffer
if exists('b:did_ftplugin')
    finish
endif

let s:keepcpo= &cpo
set cpo&vim

"let php_sql_query = 1 " SQL syntax highlighting inside strings
let php_noShortTags = 1
let g:PHP_removeCRwhenUnix = 1
let g:PHP_noArrowMatching = 1
" let g:PHP_IndentFunctionCallParameters = 1
" let g:PHP_IndentFunctionDeclaratoinParameters = 1

" =============================================================================
" Options
" =============================================================================

setlocal comments=sr:/*,mb:*,ex:*/,://      " Set comment formats
setlocal list                               " Show 'hidden' characters
setlocal suffixesadd+=.php
setlocal iskeyword+=$
let b:undo_ftplugin = '|setlocal comments< list< suffixesadd< iskeyword<'


" =============================================================================
" INDENTATION AND TEXT-WRAP
" =============================================================================
setlocal nowrap                             " Don't wrap lines
setlocal textwidth=80                       " Set textwidth
setlocal colorcolumn=+1,120                 " Set colorcolumn for 81 and 120
let b:undo_ftplugin .='|setlocal wrap< textwidth< colorcolumn<'


" =============================================================================
" KEY MAPPINGS
" =============================================================================
" inoremap <buffer> <localleader><Tab> <C-X><C-N>
" let b:undo_ftplugin .= '|iunmap <buffer> <localleader><Tab>'


" ---  COMMON STUFF / HELPERS / SNIPPETS ---
inoreabbrev puf public function NAME()<CR>{<CR><CR>}<ESC>?NAME<CR>caw
inoreabbrev pusf public static function NAME()<CR>{<CR><CR>}<ESC>?NAME<CR>caw

" private (restricted) method snippet
inoreabbrev prf private function NAME()<CR>{<CR><CR>}<ESC>?NAME<CR>caw
inoreabbrev prsf private static function NAME()<CR>{<CR><CR>}<ESC>?NAME<CR>caw


" protected  method snippet
inoreabbrev pf protected function NAME()<CR>{<CR><CR>}<ESC>?NAME<CR>caw
inoreabbrev psf protected static function NAME()<CR>{<CR><CR>}<ESC>?NAME<CR>caw

" Class snippet
nnoremap <buffer> <localleader>cl i<?php<CR><CR>declare(strict_types = 1);<CR><CR>class {2:ChildClass} extends {3:ParentClass} implements {4:Interface}<CR>{<CR>{5:body}<esc>^i	<esc>o}<esc>/\d:<CR>

let s:test_function = '\(test\|it\|beforeAll\|afterAll\|beforeEach\|afterEach\|uses\)'
let s:section = '\(.*\%#\)\@!\_^\s*\zs\('.s:test_function.'\)'
execute 'nnoremap <buffer> <silent> <localleader>tt /' . escape(s:section, '|') . '/<CR>:nohlsearch<CR>'
execute 'nnoremap <buffer> <silent> <localleader>tr ?' . escape(s:section, '|') . '?<CR>:nohlsearch<CR>'

function FileAction_NameClass()
    execute "normal! ca{\<C-R>=expand('%:t:r')\<cr>\<esc>b"
endfunction


let &cpo = s:keepcpo
unlet s:keepcpo
