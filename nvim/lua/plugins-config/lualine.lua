-- Config lualine
local lualine = {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    dependencies = { 'catppuccin/nvim' },
    event = "VeryLazy",
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = false,
                theme = 'dracula',
                component_separators = '|',
                section_separators = '',
            },
        }
    end
}

return lualine