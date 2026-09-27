return {
	{
		"vimpostor/vim-tpipeline",
		enabled = true,
		config = function()
			vim.g.tpipeline_autoembed = 0
			vim.g.laststatus = 0
		end,
	},
}
