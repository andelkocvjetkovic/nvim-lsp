local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup_format = vim.api.nvim_create_augroup("LspFormatting", {  })

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.stylelint,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds { buffer = bufnr, group = augroup_format }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({
          {
            async = false,
            bufnr = bufnr,
            name = "null-ls",
          }
        }) end
      })
    end
  end,
}
