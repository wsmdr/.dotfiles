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
            },
            -- 关闭文件时自动关闭
            auto_close = true,
            -- 不显示 git 状态图标
            git = {
                enable = true
            }
        })
        local ops = {}
        vim.keymap.set('n', '<A-m>', '<Cmd>NvimTreeToggle<CR>', ops)
    end
}

return nvimtree