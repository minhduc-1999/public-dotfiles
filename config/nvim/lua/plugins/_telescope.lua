local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"node_modules", "dist", "neo4j%-db", "stack"}
        --mappings = {
        --    i = {
        --        ["<A-x>"] = actions.select_horizontal,
        --        ["<A-v>"] = actions.select_vertical,
        --        ["<A-t>"] = actions.select_tab,
        --    },
        --    n = {
        --        ["<A-x>"] = actions.select_horizontal,
        --        ["<A-v>"] = actions.select_vertical,
        --        ["<A-t>"] = actions.select_tab,
        --    }
        --}
    }
}

vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files hidden=true no_ignore=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })
