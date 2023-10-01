return {
  "neovim/nvim-lspconfig",
  priority = 500,
  config = function()
    require "configs.lsp"
  end
}
