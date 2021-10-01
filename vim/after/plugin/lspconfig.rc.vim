if !exists('g:lspconfig')
    finish
endif

lua <<EOF
-- hrsh7th/nvim-cmp
local cmp = require'cmp'
cmp.setup {
    completion = {
        autocomplete = false
        },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
            },
        },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        }
    }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


-- gitsigns setup
local gitsigns_on_attach = function(bufnr)
-- Setup keymaps
local map = vim.api.nvim_buf_set_keymap
map(bufnr, 'n', ']c', "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'", { noremap= true, expr = true })
map(bufnr, 'n', '[c', "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'", { noremap= true, expr = true })
map(bufnr, 'n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { noremap = true })
end

local gitsigns = require'gitsigns'
gitsigns.setup {
    -- I don't use all the default mappings so turn them off and add the ones I use
    keymaps = {},
    on_attach = gitsigns_on_attach
    }


local on_attach = function (client, bufnr)
end

local lspconfig = require'lspconfig'

-- typescript/javascript tsserver
lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    }


-- PHP intelephense
lspconfig.intelephense.setup{}

EOF
