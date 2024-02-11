return {
  "mrcjkb/rustaceanvim",
  dependencies = { "neovim/nvim-lspconfig" },
  version = "^4",
  ft = "rust",
  setup = function()
    require "configs.rustatic"
    require("rustaceanvim").setup()
  end
}
