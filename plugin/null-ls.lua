local null_ls = require('null-ls')

local sources = {null_ls.builtins.formatting.prettier}

null_ls.setup({
  on_attach = function(client, buffer)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format({async=false})<CR>")

      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async=false})")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
     vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
  sources = sources,
})
