
return {
  { "EdenEast/nightfox.nvim" }, 
  {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup { 
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    }
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" }  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  { 'neovim/nvim-lspconfig' },

  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },  
  { 'hrsh7th/cmp-buffer' },  
  { 'hrsh7th/cmp-path' },     
  { 'hrsh7th/cmp-cmdline' },  

  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
}


