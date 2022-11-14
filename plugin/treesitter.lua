require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'html',
    'css',
    'scss',
    'javascript',
    'typescript',
    'regex',
    'jsdoc',
    'markdown',
    'lua',
    'jsonc',
    'yaml',
    'toml',
    'prisma'
  },
  highlight = {
    enable = true,
  },
})
