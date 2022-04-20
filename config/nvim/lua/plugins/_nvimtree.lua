local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_add_trailing = 1
require'nvim-tree'.setup {
    -- auto_close = true,
    diagnostics = {
        enable = true
    },
    view = {
        --mappings = {
        --    list = {
        --        { key = "<A-v>", cb = tree_cb("vsplit") },
        --        { key = "<A-x>", cb = tree_cb("split") },
        --        { key = "<A-t>", cb = tree_cb("tabnew") },
        --    }
        --}
    },
}

vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
