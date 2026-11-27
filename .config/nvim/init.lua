-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.number = true
vim.o.foldcolumn = "1"

local term_buf = nil

vim.keymap.set("n", "<leader>t", function()
	-- Is the terminal buffer still alive?
	if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
		-- If it's visible in a window, focus that window
		local win = vim.fn.bufwinid(term_buf)
		if win ~= -1 then
			vim.api.nvim_set_current_win(win)
		else
			-- Hidden buffer: reopen it in a bottom split
			vim.cmd("botright split")
			vim.api.nvim_set_current_buf(term_buf)
			vim.cmd("resize 15")
		end
	else
		-- No terminal yet: create one
		vim.cmd("botright split")
		vim.cmd("terminal")
		vim.cmd("resize 15")
		term_buf = vim.api.nvim_get_current_buf()
	end
	vim.cmd("startinsert")
end, { desc = "Open or focus terminal" })

vim.keymap.set("n", "<leader>s", "<cmd>vsplit<CR>", {desc = "Vertical Split"})
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", {desc = "Quit"})
