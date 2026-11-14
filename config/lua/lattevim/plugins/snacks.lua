local function pick(name, _opts)
	return function()
		Snacks.picker[name](_opts)
	end
end

return {
	{
		"snacks.nvim",
		lazy = false,
		after = function()
			---@type snacks.Config
			local opts = {
				picker = { enabled = true },
				explorer = { enabled = true },
				indent = { enabled = true },
				dashboard = {
					enabled = true,
					preset = {
						header = [[
██╗      █████╗ ████████╗████████╗███████╗██╗   ██╗██╗███╗   ███╗
██║     ██╔══██╗╚══██╔══╝╚══██╔══╝██╔════╝██║   ██║██║████╗ ████║
██║     ███████║   ██║      ██║   █████╗  ██║   ██║██║██╔████╔██║
██║     ██╔══██║   ██║      ██║   ██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗██║  ██║   ██║      ██║   ███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
						keys = {
							{
								icon = "",
								key = "f",
								desc = "Find File",
								action = ":lua Snacks.dashboard.pick('files')",
							},
							{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
							-- {
							-- 	icon = " ",
							-- 	key = "g",
							-- 	desc = "Find Text",
							-- 	action = ":lua Snacks.dashboard.pick('live_grep')",
							-- },
							{
								icon = " ",
								key = "r",
								desc = "Recent Files",
								action = ":lua Snacks.dashboard.pick('oldfiles')",
							},
							-- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
							{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
						},
					},
					sections = {
						{ section = "header" },
						{ section = "keys", gap = 1, padding = 1 },
					},
				},
			}

			require("snacks").setup(opts)
		end,
		keys = {
			{ "<leader><space>", pick("files"), desc = "Find files" },
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
