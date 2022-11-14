local languageServers = {
    'sumneko_lua',
    'rust_analyzer',
    'tsserver',
    'yamlls',
    'tailwindcss',
    'taplo',
    'solidity',
    'prismals',
    'marksman',
    'jsonls',
    'hls',
    'html',
    'graphql',
    'eslint',
    'dockerls',
    'cssls',
    'cssmodules_ls',
    'cmake',
  }

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = languageServers,
  automatic_installation = true
})

require('luasnip.loaders.from_vscode').lazy_load()
require('neodev').setup({})

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
  end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

lspconfig.tsserver.setup({
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})

-- Temporary till I am not lazy
for _, v in pairs(languageServers) do
  if(v == 'sumneko_lua') then
    lspconfig[v].setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {'vim'}
            },
            workspace = {
              checkThirdParty = false
            }
          }
        }
      })
  elseif(v == 'jsonls') then
    lspconfig[v].setup({
        filetypes = { "json", "jsonc" }
      })
  elseif (v == 'tsserver') then
    goto continue
  else
    lspconfig[v].setup({})
  end
  ::continue::
end

