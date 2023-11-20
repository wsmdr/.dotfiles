-- Config nvim-tree
local nvimtree = {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    config = function()
        require('nvim-tree').setup({
            actions = {
                change_dir = {
                    enable = true,
                    global = true
                }
            },
            renderer = {
                indent_markers = {
                    enable = true
                }
            }
        })
    end
}

return nvimtree