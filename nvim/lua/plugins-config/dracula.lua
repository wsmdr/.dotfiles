local dracula = {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme 'dracula'
        -- vim.cmd.colorscheme 'dracula-soft'
    end
}

return dracula