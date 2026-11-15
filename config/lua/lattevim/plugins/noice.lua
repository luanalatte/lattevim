return {
	{ "nui.nvim" },
	{
		"noice.nvim",
		event = "DeferredUIEnter",
		before = function()
			require("lz.n").trigger_load("nui.nvim")
		end,
		after = function()
			require("noice").setup({
				cmdline = {
					enabled = true,
					view = "cmdline_popup",
				},
				presets = {
					-- bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					lsp_doc_border = true,
				},
			})
		end,
	},
}
