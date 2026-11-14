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

			-- stop bufferline from showing on the dashboard

			-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			-- 	callback = function()
			-- 		if vim.bo.filetype == "snacks_dashboard" then
			-- 			vim.o.showtabline = 0
			-- 		else
			-- 			vim.o.showtabline = 2
			-- 		end
			-- 	end,
			-- })

			vim.api.nvim_create_autocmd("User", {
				pattern = "SnacksDashboardOpened",
				callback = function()
					vim.o.showtabline = 0
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "SnacksDashboardClosed",
				callback = function()
					vim.o.showtabline = 2
				end,
			})

			require("snacks").setup(opts)

			Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
			Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
			Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
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
