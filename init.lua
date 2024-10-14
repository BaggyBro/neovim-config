vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-n>', ":Neotree filesystem reveal left<CR>", {})

vim.cmd("colorscheme carbonfox")

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.pyright.setup{
  capabilities = capabilities,
}

lspconfig.ts_ls.setup{
  capabilities = capabilities,
}

lspconfig.clangd.setup{
  capabilities = capabilities,
}

require('rust-tools').setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', '<C-space>', require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set('n', '<Leader>a', require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

--snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

require('neo-tree').setup({
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
    },
  },
}) 

function OpenMarkdownPreview (url)
  vim.fn.system('firefox --new-window ' .. url)
end

vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
