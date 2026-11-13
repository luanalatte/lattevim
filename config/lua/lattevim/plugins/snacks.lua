local function pick(name, _opts)
	return function()
		Snacks.picker[name](_opts)
	end
end

return {
	{
		"snacks.nvim",
		after = function()
			---@type snacks.Config
			local opts = {
				picker = { enabled = true },
				explorer = { enabled = true },
			}

			require("snacks").setup(opts)
		end,
		keys = {
			{ "<leader><space>", pick("smart"), desc = "Smart find files" },
			{ "<leader>/", pick("grep"), desc = "Grep files" },
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File explorer",
			},
			{ "<leader>ff", pick("files"), desc = "Find files" },
			{ "<leader>fg", pick("git_files"), desc = "Find git files" },
			{ "<leader>fr", pick("recent"), desc = "Recent files" },
		},
	},
}
