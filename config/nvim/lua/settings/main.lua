-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"

--Incremental live completion
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

--Set tab settings
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

--Set number
vim.wo.relativenumber = true
vim.wo.number = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Indent setting
vim.o.autoindent = true
vim.o.breakindent = true

--Save undo history
vim.cmd[[set undofile]]

--Hightlight current cursor line
vim.wo.cursorline = true

--Slit window
vim.opt.splitright = true
vim.opt.splitbelow = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true

--Turn off swapfile
vim.bo.swapfile = false

--File encoding
vim.opt.fileencoding = 'utf-8'

--Turn off backup
vim.o.backup = false
vim.o.writebackup = false

vim.o.clipboard = "unnamedplus"

vim.wo.spell = false
vim.bo.spelllang = 'en_us'

vim.wo.linebreak = true 
