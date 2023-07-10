local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-nologo",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
		})
			vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
			vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
			vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

			Terminal = require("toggleterm.terminal").Terminal
			float = Terminal:new({direction='float'})
			vim.keymap.set('n', '<A-i>', function() float:toggle() end, {noremap=true, silent=true})
			vim.keymap.set('t', '<A-i>', function() float:toggle() end, {noremap=true, silent=true})
	end
}
