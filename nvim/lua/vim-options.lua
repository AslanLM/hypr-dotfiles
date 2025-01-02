--Preferences
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.smarttab = true

vim.keymap.set({ "i", "n", "v" }, "<C-c>", [[<C-\><C-n>]])

--Oil
vim.keymap.set("n", "-", ":Oil<CR>", { noremap = true, silent = true })

-- Prettier
vim.api.nvim_set_keymap(
	"n",
	"<leader>p",
	"<cmd>lua vim.lsp.buf.format() vim.notify(' Formatted with Prettier')<CR>",
	{ noremap = true, silent = true, desc = "Prettier" }
)

-- Redefine Ctrl+s to save with the custom function
vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", { noremap = true, silent = true })

-- Custom save function
function SaveFile()
	-- Check if a buffer with a file is open
	if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
		vim.notify("No file to save", vim.log.levels.WARN)
		return
	end

	local filename = vim.fn.expand("%:t") -- Get only the filename
	local success, err = pcall(function()
		vim.cmd("silent! write") -- Try to save the file without showing the default message
	end)

	if success then
		vim.notify(filename .. " Saved!") -- Show only the custom message if successful
	else
		vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
	end
end
