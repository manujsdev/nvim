local ok, mason = pcall(require, "mason")
if not ok then
	return
end

local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mason_lsp then
	return
end

local ok_lsp, lspconfig = pcall(require, "lspconfig")
if not ok_lsp then
	return
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts) -- Go to declaration of the method
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Go to definition of the method
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"svelte",
		"cssls",
		"tailwindcss",
		"unocss",
		"dockerls",
		"docker_compose_language_service",
	},
})
-- lspconfig.setup()
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	flags = lsp_flags,
})
lspconfig.svelte.setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

lspconfig.cssls.setup({ on_attach = on_attach, flags = lsp_flags })

lspconfig.angularls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

lspconfig.docker_compose_language_service.setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

lspconfig.dockerls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

-- lspconfig.unocss.setup({})
