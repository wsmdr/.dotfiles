-- Config nvim-tree
local nvimtree = {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    keys = {
        { "<A-1>", "<Cmd>NvimTreeToggle<CR>" }
    },
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
    end
}

local bufferline = {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup {
            options = {
                -- 使用 nvim 内置lsp
                -- diagnostics = "nvim_lsp",
                -- 左侧让出 nvim-tree 的位置
                offsets = { {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                } }
            }
        }
    end
}

-- Config autopairs
local autopairs = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
      -- config autopairs
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local nvim_cmp = require('cmp')
      nvim_cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  }

return { nvimtree, bufferline }
