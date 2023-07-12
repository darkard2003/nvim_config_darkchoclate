return {
	"mfussenegger/nvim-dap-python",
	lazy = true,
	ft = "python",
	config = function()
		local dap_py = require "dap-python"
		dap_py.setup([[C:\Users\kmc20\AppData\Local\nvim-data\mason\packages\debugpy\venv\Scripts\python]])
	end,
}
