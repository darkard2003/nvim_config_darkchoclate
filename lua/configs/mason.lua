local ok_mason, mason = pcall(require, "mason")
if not ok_mason then
	print("Mason not found :: " .. mason)
	return
end

local ok_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
if not ok_mason_lsp then
	print("Mason not found :: " .. mason_lsp)
	return
end

local ok_lsp, lspconfig = pcall(require, "lspconfig")
if not ok_lsp then
	print("Lspconfig not found :: " .. lspconfig)
	return
end

mason.setup()
mason_lsp.setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright",},
	handlers = {
		function(server)
			local opts = {
				capabilities = require("configs.lsp.handler").capabilities,
				on_attach = require("configs.lsp.handler").on_attach,
			}
			lspconfig[server].setup(opts)
		end,
	}
})
