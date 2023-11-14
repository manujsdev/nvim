local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    formatting.stylua,
    formatting.prettier.with({
      filetypes = {
        "html",
        "json",
        "yaml",
        "markdown",
        "md",
        "svelte",
        "javascript",
        "typescript",
        "css",
        "scss",
        "typescriptreact",
        "javascriptreact"
      },
    }),
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr }) -- this is for 0.8v
          -- vim.lsp.buf.formatting_sync() -- you should use this for 0.7 or minor
        end,
      })
    end
  end,
})
