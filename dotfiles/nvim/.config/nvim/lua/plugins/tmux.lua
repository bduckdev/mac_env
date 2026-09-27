return {
	{
		"vimpostor/vim-tpipeline",
		enabled = false,
		config = function()
			vim.g.tpipeline_autoembed = 0
			vim.g.laststatus = 0
		end,
	},
}
