if vim.fn.has("win32") == 1 then
  return {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    ---@param opts cn.ConfigSchema
    opts = {
      --   base_url = "https://carbon.now.sh/",
      open_cmd = "start",
      -- options = {
      --   bg = "gray",
      --   drop_shadow_blur = "68px",
      --   drop_shadow = false,
      --   drop_shadow_offset_y = "20px",
      --   font_family = "Hack",
      --   font_size = "18px",
      --   line_height = "133%",
      --   line_numbers = true,
      --   theme = "monokai",
      --   titlebar = "Made with carbon-now.nvim",
      --   watermark = false,
      --   width = "680",
      --   window_theme = "sharp",
      --   padding_horizontal = "0px",
      --   padding_vertical = "0px",
      -- },
    }
  }
else
  return {
    'krivahtoo/silicon.nvim',
    build = './install.sh',
    opts = true,
  }
end

