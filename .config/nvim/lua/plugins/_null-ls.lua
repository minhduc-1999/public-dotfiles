-- Ref: https://github.com/shaeinst/roshnivim/blob/main/lua/plugins/null-ls_nvim.lua

local builtins = require("null-ls.builtins")
local formatting = builtins.formatting

local sources = {}
local load = false

-- "javascript", "javascriptreact", "typescript", "typescriptreact", "vue",
-- "css", "scss", "less", "html", "json", "yaml", "markdown", "graphql"
if vim.fn.executable("prettier") == 1 then
	load = true
	sources[#sources+1] = formatting.prettier.with({
		command = "prettier",
		args = {"--stdin-filepath", "$FILENAME"},
	})
end

if load then
	require("null-ls").setup({
		sources = sources
	})
end

local keymap = vim.api.nvim_set_keymap
keymap('n', '<Space>fm', '<ESC>:lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
