local config = require "config"
local packer = require "packer"
vim.cmd [[packadd packer.nvim]]

local startup = function()
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "nvim-telescope/telescope-dap.nvim"
  use "/home/jannik/Projects/telescope-workflow.nvim"
  use "/home/jannik/Projects/telescope-project-workflow.nvim"
  use "neovim/nvim-lspconfig"
  use "nvim-lua/lsp-status.nvim"
  use "tami5/lspsaga.nvim"
  use "~/Projects/nvim-lsp-installer"
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "lukas-reineke/indent-blankline.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "rebelot/kanagawa.nvim"
  use "nvim-lualine/lualine.nvim"
  use "mfussenegger/nvim-dap"
  use "Pocco81/DAPInstall.nvim"
  use "lewis6991/spellsitter.nvim"
  use "lewis6991/gitsigns.nvim"
  use "numToStr/Comment.nvim"
  use "windwp/nvim-spectre"
  use "windwp/nvim-autopairs"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lua"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "keng1ne/filetype.nvim"
  use "keng1ne/jmaps"
  use "f-person/git-blame.nvim"
  use "tpope/vim-fugitive"
  use "ollykel/v-vim"
  use "glepnir/dashboard-nvim"
  use "crispgm/nvim-go"
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  use "mcauley-penney/tidy.nvim"
  use "sainnhe/sonokai"
  use "ziglang/zig.vim"
  use "folke/tokyonight.nvim"
end
packer.startup(startup)

-- will call setup()
-- in every module
config.init {
  "defaults",
  "keybindings",
  "interface",
  "treesitter",
  "language-server",
  "debug-adapter",
  "completion",
}
