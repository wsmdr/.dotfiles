-- Config gitsigns
local gitsigns = {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('gitsigns').setup {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        }
        -- keymap for previewing hunks
        vim.keymap.set('n', '<leader>gh', '<cmd>Gitsigns preview_hunk<cr>', { desc = '[G]itsigns preview [H]unks' })
        vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns prev_hunk<cr>', { desc = '[G]itsigns [P]revious hunk' })
        vim.keymap.set('n', '<leader>gn', '<cmd>Gitsigns next_hunk<cr>', { desc = '[G]itsigns [N]ext hunk' })
    end
}

return gitsigns