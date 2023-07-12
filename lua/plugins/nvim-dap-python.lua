return {
	"mfussenegger/nvim-dap-python",
	lazy = true,
	ft = "python",
	config = function()
		local dap_py = require "dap-python"

		local function getdebugpypath()
			local p = table.concat({vim.fn.stdpath "data", "mason", "packages", "debugpy", "venv", "Scripts", "python"}, '/')
			-- Check if it is executable
			if vim.fn.executable(p) ~= 1 then
				p = table.concat({vim.fn.stdpath "data", "mason", "packages", "debugpy", "venv", "bin", "python"}, '/')
			end
			return p
		end

		dap_py.setup(getdebugpypath())
	end,
}
