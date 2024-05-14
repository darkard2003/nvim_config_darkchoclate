if vim.fn.has("unix") == 0 then
  return {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    ---@param opts cn.ConfigSchema
    opts = {
      --   base_url = "https://carbon.now.sh/",
      open_cmd = "start",
      options = {
        bg = "pink",
        drop_shadow_blur = "68px",
        drop_shadow = true,
        drop_shadow_offset_y = "20px",
        font_family = "Hack",
        font_size = "18px",
        line_height = "133%",
        line_numbers = true,
        theme = "monokai",
        titlebar = "DarkChoclate",
        watermark = false,
        width = "680",
        window_theme = "rounded",
        padding_horizontal = "100px",
        padding_vertical = "100px",
      },
    }
  }
else
  return {
    'krivahtoo/silicon.nvim',
    build = './install.sh',
    config = function()
      require('silicon').setup({
        theme = 'Monokai Extended',
        output = {
          clipboard = false,
        }
      })
    end
  }
end
