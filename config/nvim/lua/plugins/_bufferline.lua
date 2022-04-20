require('bufferline').setup {
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }
    }
}

vim.api.nvim_set_keymap("n", "<A-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>wl", ":BufferLineCloseLeft<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>wr", ":BufferLineCloseRight<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>wp", ":BufferLinePickClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", ":BufferLinePick<CR>", { noremap = true, silent = true })
