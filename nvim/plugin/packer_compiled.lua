-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/rahulc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/rahulc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/rahulc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/rahulc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rahulc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ale = {
    config = { "\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvimd\0\0\3\1\5\1\0156\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\5€-\0\0\0'\2\3\0B\0\2\2\14\0\0\0X\1\3€-\0\0\0'\2\4\0B\0\2\2L\0\2\0\0À\n<Tab>\n<C-n>\15pumvisible\afn\bvim\2’\1\1\0\a\0\v\0\0143\0\0\0006\1\1\0003\2\3\0=\2\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0005\6\n\0B\1\5\0012\0\0€K\0\1\0\1\0\2\texpr\2\fnoremap\2\22v:lua.smart_tab()\n<Tab>\6i\20nvim_set_keymap\bapi\bvim\0\14smart_tab\a_G\0\0" },
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/ale"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/bufdelete.nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/coc.nvim"
  },
  conjure = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/opt/conjure"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\nO\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\26use_extended_mappings\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/kommentary"
  },
  ["material.nvim"] = {
    config = { "\27LJ\2\nc\0\0\3\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\1\6\0=\1\5\0K\0\1\0\14palenight\19material_style\6g\bvim\bset\rmaterial\frequire\0" },
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/material.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n6\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nright\19nvim_tree_side\6g\bvim\0" },
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/packer.nvim"
  },
  ["parinfer-rust"] = {
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/parinfer-rust"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-sexp"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/opt/vim-sexp"
  },
  ["vim-terraform"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/opt/vim-terraform"
  },
  ["windline.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20wlsample.bubble\frequire\0" },
    loaded = true,
    path = "/Users/rahulc/.data/nvim/site/pack/packer/start/windline.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: ale
time([[Config for ale]], true)
try_loadstring("\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvimd\0\0\3\1\5\1\0156\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\5€-\0\0\0'\2\3\0B\0\2\2\14\0\0\0X\1\3€-\0\0\0'\2\4\0B\0\2\2L\0\2\0\0À\n<Tab>\n<C-n>\15pumvisible\afn\bvim\2’\1\1\0\a\0\v\0\0143\0\0\0006\1\1\0003\2\3\0=\2\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0005\6\n\0B\1\5\0012\0\0€K\0\1\0\1\0\2\texpr\2\fnoremap\2\22v:lua.smart_tab()\n<Tab>\6i\20nvim_set_keymap\bapi\bvim\0\14smart_tab\a_G\0\0", "config", "ale")
time([[Config for ale]], false)
-- Config for: windline.nvim
time([[Config for windline.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20wlsample.bubble\frequire\0", "config", "windline.nvim")
time([[Config for windline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n6\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nright\19nvim_tree_side\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\26use_extended_mappings\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\1\6\0=\1\5\0K\0\1\0\14palenight\19material_style\6g\bvim\bset\rmaterial\frequire\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType terraform ++once lua require("packer.load")({'vim-terraform'}, { ft = "terraform" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'vim-sexp', 'conjure'}, { ft = "clojure" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/rahulc/.data/nvim/site/pack/packer/opt/vim-terraform/ftdetect/hcl.vim]], true)
vim.cmd [[source /Users/rahulc/.data/nvim/site/pack/packer/opt/vim-terraform/ftdetect/hcl.vim]]
time([[Sourcing ftdetect script at: /Users/rahulc/.data/nvim/site/pack/packer/opt/vim-terraform/ftdetect/hcl.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
