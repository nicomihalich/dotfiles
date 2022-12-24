local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

return require('packer').startup(function(use)
  use({ 'wbthomason/packer.nvim' })

  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'BurntSushi/ripgrep' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'debugloop/telescope-undo.nvim' }
    },
    config = function() require('my.telescope') end
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = '<cmd>TSUpdate',
    requires = {
      { 'RRethy/nvim-treesitter-endwise' },
      {
        'p00f/nvim-ts-rainbow',
        config = function() require('my.nvim-ts-rainbow') end
      }
    },
    config = function() require('my.treesitter') end
  })

  use({
    'glepnir/lspsaga.nvim',
    requires = {
      { 'neovim/nvim-lspconfig' },
    },
    config = function() require('my.lspsaga') end
  })

  use({ 'hrsh7th/nvim-cmp',
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
      { 'onsails/lspkind.nvim' },
      { 'windwp/nvim-autopairs' },
    },
    config = function() require('my.nvim-cmp') end
  })

  use({ 'mfussenegger/nvim-dap',
    requires = {
      { 'rcarriga/nvim-dap-ui' }
    },
    config = function() require('my.nvim-dap') end
  })

  use({ 'williamboman/mason.nvim',
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function() require('my.mason') end
  })

  use({ 'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
    config = function() require('my.nvim-lightbulb') end
  })

  use({
    'simrat39/rust-tools.nvim',
    requires = {
      { 'neovim/nvim-lspconfig' },
    },
    config = function() require('my.rust-tools') end
  })

  use({
    'stevearc/aerial.nvim',
    config = function() require('my.aerial') end
  })

  use({ 'nvim-tree/nvim-tree.lua',
    requires = {
      { 'nvim-tree/nvim-web-devicons' }
    },
    config = function() require('my.nvim-tree') end
  })

  use({ 'nvim-lualine/lualine.nvim',
    requires = {
      { 'nvim-tree/nvim-web-devicons' }
    },
    config = function() require('my.lualine') end
  })

  use({
    'windwp/nvim-autopairs',
    config = function() require('my.nvim-autopairs') end
  })

  use({
    'tpope/vim-fugitive',
    config = function() require('my.fugitive') end
  })
  use({
    'lewis6991/gitsigns.nvim',
    config = function() require('my.gitsigns') end
  })
  use({
    'mbbill/undotree',
    config = function() require('my.undotree') end
  })
  use({
    'vim-test/vim-test',
    config = function() require('my.vim-test') end
  })

  use({ 'christoomey/vim-tmux-navigator' })
  use({ 'qpkorr/vim-bufkill' })
  use({ 'stefandtw/quickfix-reflector.vim' })
  use({ 'tpope/vim-surround' })
  use({ 'tpope/vim-commentary' })
  use({ 'editorconfig/editorconfig-vim' })

  use({ 'rose-pine/neovim', config = function() require('my.colors.rose-pine') end })
  use({ 'catppuccin/nvim', config = function() require('my.colors.catppuccin') end })
  use({ 'rebelot/kanagawa.nvim', config = function() require('my.colors.kanagawa') end })
  use({ 'ellisonleao/gruvbox.nvim', config = function() require('my.colors.gruvbox') end })
  use({ 'EdenEast/nightfox.nvim' })

  if ensure_packer() then
    require('packer').sync()
  end
end)
