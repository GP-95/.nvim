vim.g.mapleader = ' '

local key_mapper = function(mode, key, result) 
	vim.api.nvim_set_keymap(
		mode,
		key,
		result,
		{noremap = true, silent = true}
	)
end

-- Disable arrows
key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')

-- Escape insert mode
key_mapper('i', 'jk', '<ESC>')
key_mapper('i', 'JK', '<ESC>')
key_mapper('i', 'jK', '<ESC>')
key_mapper('v', 'jk', '<ESC>')
key_mapper('v', 'JK', '<ESC>')
key_mapper('v', 'jK', '<ESC>')

-- Move between windows
key_mapper('n', '<C-H>', '<C-W>h') -- move left
key_mapper('n', '<C-L>', '<C-W>l') -- move right
key_mapper('n', '<C-K>', '<C-W>k') -- move up
key_mapper('n', '<C-J>', '<C-W>j') -- move down

-- Bufferline
key_mapper('n', '<S-h>', ':BufferLineCyclePrev<CR>') -- Prev buffer
key_mapper('n', '<S-l>', ':BufferLineCycleNext<CR>') -- Next buffer
key_mapper('n', '<S-j>', ':BufferLineMovePrev<CR>') -- Move current buffer left
key_mapper('n', '<S-k>', ':BufferLineMoveNext<CR>') -- Move current buffer right
key_mapper('n', '<S-c>', ':BufferLineCloseRight<CR>') -- Close current buffer

-- LSP
key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<leader>k', ':lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

-- Telescope FZF
key_mapper('n', 'ff', ':lua require"telescope.builtin".find_files()<CR>')
key_mapper('n', 'fg', ':lua require"telescope.builtin".live_grep()<CR>')
key_mapper('n', 'fh', ':lua require"telescope.builtin".help_tags()<CR>')
key_mapper('n', 'fb', ':lua require"telescope.builtin".buffers()<CR>')

-- Toggle term
key_mapper('n', '<C-t>', ':ToggleTerm<CR>') -- toggle terminal
key_mapper('t', '<C-t>', '<C-\\><C-N>') -- exit terminal mode

-- Comment
--key_mapper('n', 'fic', 'gcc')

-- Close buffer
key_mapper('n', '<C-c>', ':bd<CR>')


-- Highlight selection
key_mapper('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
key_mapper('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
key_mapper('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]])
key_mapper('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]])
key_mapper('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]])
key_mapper('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]])

key_mapper('n', '<Leader>l', ':noh<CR>')


-- Copy to clipboard
key_mapper('v', '<leader>y', '"+y')

-- Diagnostic bindings
key_mapper('n', '<leader>s', ':lua vim.diagnostic.open_float()<CR>')
key_mapper('n', '<leader>a', ':lua vim.diagnostic.goto_prev()<CR>')
key_mapper('n', '<leader>d', ':lua vim.diagnostic.goto_next()<CR>')
