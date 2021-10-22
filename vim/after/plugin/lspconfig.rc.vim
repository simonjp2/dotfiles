if !exists('g:lspconfig')
    finish
endif

lua <<EOF
local lspconfig = require'lspconfig'
local on_attach = function (client, bufnr)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = require('cmp_nvim_lsp').update_capabilities(updated_capabilities)

local servers = {
    tsserver = {
        filetypes = {
            "javascript",
            "typescript",
            },
        },

    intelephense = {
        filetypes = {
            "php",
            },
        },
    -- TODO: not sure I need this
    -- html = {
    --     filetype = {
    --         "html",
    --         }
    --     },
}


local setup_server = function (server, config)
if not config then
    return
end

if type(config) ~= "table" then
    config = {}
end

config = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = updated_capabilities,
    }, config)

lspconfig[server].setup(config)
end


for server, config in pairs(servers) do
    setup_server(server, config)
end

EOF
