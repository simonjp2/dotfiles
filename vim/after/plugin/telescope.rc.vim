if !exists('g:loaded_telescope') | finish | endif

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

lua << EOF
require('telescope').setup{
defaults = {
    vimgrep_arguments = {
        'ag',
        '--column',
        '--nocolor',
        '--nogroup',
        '--numbers',
        '--recurse',
        '--smart-case'
        }
    }
}
EOF

