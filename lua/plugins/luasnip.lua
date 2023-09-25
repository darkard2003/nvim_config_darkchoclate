return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  priority = 500,

  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,

}
