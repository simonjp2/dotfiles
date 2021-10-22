lua <<EOF
local gitsigns_on_attach = function(bufnr)
local map = vim.api.nvim_buf_set_keymap
map(bufnr, 'n', ']c', "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'", { noremap= true, expr = true })
map(bufnr, 'n', '[c', "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'", { noremap= true, expr = true })
map(bufnr, 'n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { noremap = true })
end

local gitsigns = require'gitsigns'
gitsigns.setup {
    -- I don't use all the default mappings so turn them off and add the ones I use
    keymaps = {},
    on_attach = gitsigns_on_attach,
    numhl = true,
    }
EOF
