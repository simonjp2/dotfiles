" =============================================================================
" Jason Simon php settings
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
setlocal suffixesadd+=.php
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


" ---  COMMON STUFF / HELPERS / SNIPPETS ---
iabbrev puf public function NAME()<CR>{<CR><CR>}jj?NAME<CR>caw
iabbrev pusf public static function NAME()<CR>{<CR><CR>}jj?NAME<CR>caw
" public (unrestricted) method snippet
" nnoremap <buffer> <localleader>uf ipublic function ()<CR>{<CR><CR>}<esc>3k2Wi
" inoremap <buffer> <localleader>uf public function ()<CR>{<CR><CR>}<esc>3k2Wi
" let b:undo_ftplugin .= '|nunmap <buffer> <localleader>uf'
"             \ . '|iunmap <buffer> <localleader>uf'

" public (unrestricted) static method snippet
" nnoremap <buffer> <localleader>usf ipublic static function ()<CR>{<CR><CR>}<esc>3k3Wi
" inoremap <buffer> <localleader>usf public static function ()<CR>{<CR><CR>}<esc>3k3Wi
" let b:undo_ftplugin .= '|nunmap <buffer> <localleader>usf'
"             \ . '|iunmap <buffer> <localleader>usf'


" private (restricted) method snippet
iabbrev prf private function NAME()<CR>{<CR><CR>}jj?NAME<CR>caw
iabbrev prsf private static function NAME()<CR>{<CR><CR>}jj?NAME<CR>caw
" nnoremap <buffer> <localleader>rf iprivate function ()<CR>{<CR><CR>}<esc>jk3k2Wi
" inoremap <buffer> <localleader>rf private function ()<CR>{<CR><CR>}<esc>jk3k2Wi
" let b:undo_ftplugin .= '|nunmap <buffer> <localleader>rf'
"             \ . '|iunmap <buffer> <localleader>rf'

" private (restricted) static method snippet
" nnoremap <buffer> <localleader>rsf iprivate static function ()<CR>{<CR><CR>}<esc>jk3k3Wi
" inoremap <buffer> <localleader>rsf private static function ()<CR>{<CR><CR>}<esc>jk3k3Wi
" let b:undo_ftplugin .= '|nunmap <buffer> <localleader>rsf'
"             \ . '|iunmap <buffer> <localleader>rsf'


" protected  method snippet
nnoremap <buffer> <localleader>pf iprotected function ()<CR>{<CR><CR>}<esc>jk3k2Wi
inoremap <buffer> <localleader>pf protected function ()<CR>{<CR><CR>}<esc>jk3k2Wi
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>pf'
            \ . '|iunmap <buffer> <localleader>pf'

" protected static method snippet
nnoremap <buffer> <localleader>psf iprotected static function ()<CR>{<CR><CR>}<esc>jk3k3Wi
inoremap <buffer> <localleader>psf protected static function ()<CR>{<CR><CR>}<esc>jk3k3Wi
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>psf'
            \ . '|iunmap <buffer> <localleader>psf'

" Class snippet
nnoremap <buffer> <localleader>cl i<?php<CR><CR>declare(strict_types = 1);<CR><CR>class {2:ChildClass} extends {3:ParentClass} implements {4:Interface}<CR>{<CR>{5:body}<esc>^i	<esc>o}<esc>/\d:<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>cl'


" Test snippet
nnoremap <buffer> <localleader>tc i<?php<CR><CR>declare(strict_types = 1);<CR><CR>namespace Tests\{1:name_space}<CR><CR>use PHPUnit\Framework\TestCase;<CR><CR>final class {2:ClassName} extends TestCase<CR>{<CR>/**<CR>@test<CR>/<esc>V2k=2jopublic function true_is_true()<CR>{<CR>$this->assertTrue(true);<CR>}<CR>}<esc>/\d:<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>tc'

nnoremap <buffer> <localleader>tf o/**<CR>@test<CR>/<esc>V2k=2jopublic function ()<CR>{<CR><CR>}<esc>3kf(i
inoremap <buffer> <localleader>tf /**<CR>@test<CR>/<esc>V2k=2jopublic function ()<CR>{<CR><CR>}<esc>3kf(i
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>tf'
            \ . '|iunmap <buffer> <localleader>tf'
