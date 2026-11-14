return {
	{
		"mini.icons",
		beforeAll = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
		after = function()
			require("mini.icons").setup({})
		end,
	},
	{
		"lualine.nvim",
		lazy = false,
		after = function()
			require("lualine").setup({
				options = {
					globalstatus = true,
					component_separators = "",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_x = { "filetype" },
					lualine_y = {},
				},
			})
		end,
	},
}
