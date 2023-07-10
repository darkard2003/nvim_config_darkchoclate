local opts = {
	number = true,
	smarttab = true,
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,
	autoindent = true,
	termguicolors=true,
	mouse='a',
	splitbelow=true,
	splitright=true,
	relativenumber=true,
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end
