vim.g.mapleader = ' '
vim.g.localleader = ','

local visual_mappings = {
  ['<C-r>'] = '"hy:%s/<C-r>h//g<LEFT><LEFT>'
}

local normal_mappings = {
  ['<LEADER>n'] = ':NvimTreeToggle<CR>',
  ['<LEADER>ff'] = ':Telescope find_files<CR>',
  ['<LEADER>fg'] = ':Telescope live_grep<CR>',
  ['<LEADER>fb'] = ':Telescope buffers<CR>',
  ['<LEADER>bd'] = ':Bwipeout<CR>',
}

for mapping, action in pairs(visual_mappings) do
  vim.api.nvim_set_keymap('v', mapping, action, {noremap = true, silent = true})
end

for mapping, action in pairs(normal_mappings) do
  vim.api.nvim_set_keymap('n', mapping, action, {noremap = true, silent = true})
end
