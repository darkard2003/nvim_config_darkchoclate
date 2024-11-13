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

local ensure_installed = { "lua_ls" }

if vim.fn.executable("clang") == 1 then
  table.insert(ensure_installed, "clangd")
end

if vim.fn.executable("python") == 1 then
  table.insert(ensure_installed, "pyright")
end

if vim.fn.executable("ng") == 1 then
  table.insert(ensure_installed, "angularls")
end

if vim.fn.executable("go") == 1 then
  table.insert(ensure_installed, "gopls")
end

mason.setup()
mason_lsp.setup({
  ensure_installed = ensure_installed,
  handlers = {
    function(server)
      local opts = {
        capabilities = require("configs.lsp.handler").capabilities,
        on_attach = require("configs.lsp.handler").on_attach,
      }

      if server == "lua_ls" then
        local lua_opts = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
        }
        opts = vim.tbl_deep_extend("force", lua_opts, opts)
      end
      lspconfig[server].setup(opts)
    end,
  },
})
