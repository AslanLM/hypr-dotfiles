return {
	-- Plugin: which-key.nvim
	"folke/which-key.nvim",

	event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event

	init = function()
		-- Set the timeout for key sequences
		vim.o.timeout = true
		vim.o.timeoutlen = 300 -- Set the timeout length to 300 milliseconds
	end,

	keys = {
		{
			-- Keybinding to show which-key popup
			"<leader>?",
			function()
				require("which-key").show({ global = false }) -- Show the which-key popup for local keybindings
			end,
		},
	},
}
