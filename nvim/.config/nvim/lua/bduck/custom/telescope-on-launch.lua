vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("deez_nuts", { clear = true }),
	callback = function()
		if not Is_something_shown() then
			--vim.cmd.Ex()
			vim.cmd.Oil()
			vim.cmd.Telescope("find_files")
		end
	end,
})

Is_something_shown = function()
	if vim.fn.argc() > 0 then
		return true
	end

	local listed_buffers = vim.tbl_filter(function(buf_id)
		return vim.fn.buflisted(buf_id) == 1
	end, vim.api.nvim_list_bufs())
	if #listed_buffers > 1 then
		return true
	end

	local n_lines = vim.api.nvim_buf_line_count(0)
	if n_lines > 1 then
		return true
	end
	local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, true)[1]
	if string.len(first_line) > 0 then
		return true
	end

	return false
end
