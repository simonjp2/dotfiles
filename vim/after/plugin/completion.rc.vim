if !exists('g:loaded_cmp')
    finish
endif

set completeopt+=menuone		" Insert the longest commans substring
set completeopt+=noinsert		" Don't insert anything until I select it
set completeopt+=noselect		" Force me to select something
set completeopt-=preview		" Don't Show extra info in preview window

lua <<EOF
-- hrsh7th/nvim-cmp
local cmp = require'cmp'
cmp.setup {
    -- completion = {
    --     autocomplete = false
    --     },

    mapping = {
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        -- Emmet uses <C-y>
        ['<C-y>'] = cmp.config.disable, 
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<cr>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
            },
        },

    -- order of the sources matter; it gives them priority
    -- you can configure
    --      keyword_length - prevent completing suggestion < keyword_length
    --      priority
    --      max_item_count
    --      (more)
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer', keyword_length = 5, max_item_count = 10 },
        },

    formatting = {
        format = function (entry, vim_item)
            -- append the completion source to vim_item
            local menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                }
            vim_item.menu = menu[entry.source.name]
            return vim_item
        end
    },
    
    experimental = {
        native_menu = false,
        }
}
EOF

" nvim-cmp highlight groups
highlight CmpItemAbbrDeprecatedDefault ctermfg=3
highlight link CmpItemMenu NonText
