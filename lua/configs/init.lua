local globals_ok, globals = pcall(require, "configs.globals")
if not globals_ok then
  print("Error loading globals: " .. globals)
end

local keymap_ok, keymap = pcall(require, "configs.keymaps")
if not keymap_ok then
  print("Error loading keymaps: " .. keymap)
end

local opts_ok, opts = pcall(require, "configs.opts")
if not opts_ok then
  print("Error loading opts: " .. opts)
end

local lazy_ok, lazy = pcall(require, "configs.lazy")
if not lazy_ok then
  print("Error loading lazy: " .. lazy)
  return
end

vim.cmd.colorscheme "catppuccin"
