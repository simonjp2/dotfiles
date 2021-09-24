if !exists('g:lspconfig')
    finish
endif

" lua require('lspconfig').intelephense.setup{on_attach=require'completion'.on_attach}
" lua require('lspconfig').intelephense.setup{}
" lua require('lspconfig').tsserver.setup{}

lua <<EOF
local on_attach = function (client, bufnr)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})
end

local lspconfig = require'lspconfig'

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
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        }
    }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

 
-- typescript/javascript tsserver
lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    }


-- PHP intelephense
lspconfig.intelephense.setup{}

EOF
