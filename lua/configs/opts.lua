local opts = {
  number = true,
  smarttab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  autoindent = true,
  expandtab = true,
  termguicolors = true,
  mouse = "a",
  splitbelow = true,
  splitright = true,
  relativenumber = true,
  foldmethod = "syntax",
  foldlevelstart = 99,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end

local powershell_options = {
  shell = vim.fn.executable("pwsh") and "pwsh" or "powershell -NoLogo",
  shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

if jit.os == "Windows" then
  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end
