if !exists('g:loaded_telescope') | finish | endif

nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fF <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

lua << EOF
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["q"] = require('telescope.actions').close
                },
            },
        -- path_display = {"smart"},
        vimgrep_arguments = {
            'ag',
            '--column',
            '--nocolor',
            '--nogroup',
            '--numbers',
            '--recurse',
            '--smart-case',
            '--path-to-ignore=./.ignore',
            }
        },

    pickers = {
        find_files = {
            theme = "ivy",
            },

        git_files = {
            theme = "ivy",
            },

        live_grep = {
            theme = "ivy",
            }
            -- layout_strategy = "vertical",
            -- layout_config = {
            --     height = .85,
            --     mirror = "true",
            --     preview_cutoff = 0,
            --     prompt_position = "top"
            --     },
            -- },
        },
}
EOF

