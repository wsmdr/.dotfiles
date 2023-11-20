local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local dracula = {
  "Mofiqul/dracula.nvim",
  name = "dracula",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'dracula-soft'
  end
}

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



require("lazy").setup({
    dracula,
    lualine,
})

