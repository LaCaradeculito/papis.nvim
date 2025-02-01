-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
    -- import your plugins
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {
            "jghauser/papis.nvim",
            dependencies = {
              "kkharji/sqlite.lua",
              "MunifTanjim/nui.nvim",
              "pysan3/pathlib.nvim",
              "nvim-neotest/nvim-nio",
              -- if not already installed, you may also want:
              "nvim-telescope/telescope.nvim",
              "hrsh7th/nvim-cmp",
		},
		config = function()
			require("papis").setup({
				enable_keymaps = true,
			})
		end
	},

    { import = "plugins" },
    },
    checker = { enabled = true },
    })

vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.wrap = true
