vim.o.history = 1000
vim.o.so = 7
vim.o.wildmenu = true
vim.o.ruler = true
vim.o.cmdheight = 2
vim.o.hid = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.lazyredraw = true
vim.o.magic = true
vim.o.showmatch = true
vim.o.mat = 2
vim.o.errorbells = false
vim.o.visualbell = false
vim.o.tm = 500
vim.o.foldcolumn = '1'
vim.o.number = true
vim.o.clipboard = 'unnamedplus'
vim.o.updatetime = 300
vim.o.cursorline = true
vim.o.inccommand = 'nosplit'
vim.o.encoding = 'utf8'
vim.o.ffs = 'unix,dos,mac'
vim.o.backup = false
vim.o.wb = false
vim.o.swapfile = false
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.ai = true
vim.o.si = true
vim.o.wrap = true

vim.g.strip_whitespace_confirm = false

vim.cmd[[autocmd BufEnter * EnableStripWhitespaceOnSave]]
vim.cmd[[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]]
