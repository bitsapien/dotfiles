local execute      = vim.api.nvim_command
local fn           = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

return require("packer").startup(
  function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Colorscheme
    use {
      "marko-cerovac/material.nvim",
      config = function()
        require('material').set()
        vim.g.material_style = "palenight"
      end,
    }

    -- Comments
    use {
      "b3nj5m1n/kommentary",
      config = function()
        require('kommentary.config').use_extended_mappings()
      end,
    }

    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        vim.g.nvim_tree_side = 'right'
      end,
    }
    use "kyazdani42/nvim-web-devicons"
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
    }
    use {
      "akinsho/nvim-bufferline.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config   = function()
        require("bufferline").setup{}
      end,
    }
    use "ntpeters/vim-better-whitespace"
    use {
      "hashivim/vim-terraform",
      ft = {"terraform"},
    }
    use {
      "dense-analysis/ale",
      config = function()
        local function t(str)
            return vim.api.nvim_replace_termcodes(str, true, true, true)
        end

        function _G.smart_tab()
            return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
        end

        vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
      end,
    }
    use {
      "neoclide/coc.nvim",
      branch = "release",
    }
    use {
      "windwp/windline.nvim",
      config = function()
        require("wlsample.bubble")
      end,
    }
    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config   = function()
        require("gitsigns").setup()
      end,
    }
    use {
      "Olical/conjure",
      ft = {"clojure"},
    }
    use {
      "guns/vim-sexp",
      ft = {"clojure"},
    }
    use {
      "eraserhd/parinfer-rust",
      run = {"cargo build --release"},
    }
    use "famiu/bufdelete.nvim"
  end
)
