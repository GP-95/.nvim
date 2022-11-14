require("prettier").setup({
    bin = 'prettier',
    filetypes = {
      'css',
      'html',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'scss',
      'yaml',
      'json',
      'haskell',
      'markdown',
      'rust',
      'go'
  },
  -- cli_options = {
  --   arrow_parens = 'always',
  --   bracket_spacing = true,
  --   embedded_language_formatting = 'auto',
  --   print_width = 80,
  --   semi = false,
  --   use_tabs = false
  -- }
})
