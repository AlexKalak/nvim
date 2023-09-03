local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')


lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'clangd'
})

lsp.setup()

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local cmp = require ('cmp')
cmp.setup({
  mapping = {
		['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
		['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['<C-M-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-M-j>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable,
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = false }),
  },
})


local ccls_lsp_config = {
	name = 'clangd',
	cmd = {'clangd'},
}

vim.lsp.start({
	name = 'clangd',
	cmd = {'clangd'},
      	root_dir = vim.fs.dirname(vim.fs.find({'main.cpp'}, { upward = true })[1]),
})
	
