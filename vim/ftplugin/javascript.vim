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

setlocal omnifunc=v:lua.vim.lsp.omnifunc
let b:undo_ftplugin ='|setlocal omnifunc<'

" =============================================================================
" KEY MAPPINGS
" =============================================================================
" inoremap <buffer> <localleader><Tab> <C-X><C-N>
" let b:undo_ftplugin .= '|iunmap <buffer> <localleader><Tab>'


let s:function = '\(function\|\$scope\)'
let s:section = '\(.*\%#\)\@!\_^\s*\zs\('.s:function.'\)'
execute 'nnoremap <buffer> <silent> ]] /' . escape(s:section, '|') . '/<CR>:nohlsearch<CR>'
execute 'nnoremap <buffer> <silent> [[ ?' . escape(s:section, '|') . '?<CR>:nohlsearch<CR>'



function Angular_Format_Controller()
    execute "normal! i(function() {\<CR>\<ESC>f(%0Di})();\<ESC>gg"
    execute "normal! /App\<CR>dt.iangular\<CR>.module('app')\<CR>\<ESC>"
    execute "normal! f'yi'/function\<CR>ewPa \<ESC>"
    execute "normal! ?\\(controller\\|factory\\)\<CR>f'yi'f[Pa);\<CR>\<CR>\<ESC>"
    execute "normal! pa.$inject = \<ESC>$xa];\<ESC>0o\<ESC>"
    execute "normal! gg=G"
endfunction
nnoremap <buffer> <localleader>afc :call Angular_Format_Controller()<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>afc'

function Angular_Format_Scope_Fn()
    execute "normal! ^df.ifunction \<ESC>eldt("
endfunction
nnoremap <buffer> <localleader>aff :call Angular_Format_Scope_Fn()<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>aff'


function s:CreateIIFE()
    execute "normal! i(function () {\<CR>})();\<ESC>O"
    execute "normal! i\<Tab>'use strict'\<CR>\<CR>\<ESC>"
endfunction

function AngularNewControllerTemplate()
    normal! i(function() {})();Oangular.module([1:module_name]).controller([2:controller_name], [3:constructorFn]);[3:constructorFn].$inject = [];function [3:constructorFn]() {let model = this;}gg=G/[\d:
endfunction

function AngularGenerateDirective(module_name = 'app')
    call s:CreateIIFE()
    let directiveDefinition = [
                \ "restrict: 'E'",
                \ "scope: {}",
                \ "templateUrl: [3:pathToTemplate]",
                \ "controller: [4: controllerName]",
                \ "controllerAs: '$ctrl'",
                \ "bindToController: true",
                \ ]

    execute "normal! iangular\<CR>.module('" . a:module_name . "')\<CR>.directive('[1:directiveName]', [2:factoryFn]);\<CR>\<CR>"
    execute "normal! i[2:factoryFn].$inject = [];\<CR>\<CR>"
    execute "normal! ifunction [2:factoryFn] () {\<CR>return {\<CR>". join(l:directiveDefinition, ",\<CR>") . "\<CR>}\<CR>}"
    execute "normal! gg=G"
    execute "normal! /\\[\\d:.\\{-}\]\<CR>"
endfunction

function Angular_Generate_Factory_Fn(type, api_name, name, factory_fn)
    execute "normal! i(function () {\<CR>})();\<ESC>O"
    execute "normal! iangular\<CR>.module('app')\<CR>." . a:type . "('" . a:name . "', " . a:factory_fn . ");\<CR>\<CR>"
    execute "normal! i" . a:factory_fn . ".$inject = [];\<CR>\<CR>"
    execute "normal! ifunction " . a:factory_fn . "() {\<CR>}\<ESC>O"
    execute "normal! ilet " . a:api_name . " = {\<CR>\<ESC>m1i\<CR>}\<CR>return " . a:api_name . ";"
    execute "normal! gg=G"
    execute "normal! `1"
endfunction

function Angular_Generate_Factory(name, factory_fn)
    call Angular_Generate_Factory_Fn('factory', 'service', a:name, a:factory_fn)
endfunction
nnoremap <buffer> <localleader>agf :call Angular_Generate_Factory()<LEFT>
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>afg'

nnoremap <buffer> <localleader>agd :call AngularGenerateDirective()<LEFT>
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>agd'
