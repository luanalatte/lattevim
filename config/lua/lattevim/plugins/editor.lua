return {
	{
		"conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format()
				end,
				desc = "Format",
			},
		},
		after = function()
			local langs = require("lattevim.langs")

			require("conform").setup({
				default_format_opts = {
					timeout_ms = 500,
					async = true,
					lsp_format = "fallback",
				},
				formatters = {
					["keep-sorted"] = {
						command = "keep-sorted",
						stdin = true,
						args = { "-" },
					},
				},
				formatters_by_ft = vim.tbl_deep_extend(
					"force",
					langs.formatters_by_ft(),
					{ ["*"] = { "keep-sorted" } }
				),
				format_on_save = {},
			})
		end,
	},
	{
		"mini.pairs",
		event = "InsertEnter",
		after = function()
			require("mini.pairs").setup({
				modes = { insert = true, command = true, terminal = false },
				-- skip autopair when next character is one of these
				skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
				-- skip autopair when the cursor is inside these treesitter nodes
				skip_ts = { "string" },
				-- skip autopair when next character is closing pair
				-- and there are more closing pairs than opening pairs
				skip_unbalanced = true,
			})
		end,
	},
}
