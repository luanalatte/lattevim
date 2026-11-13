return {
	{
		"mini.icons",
		on_require = { "mini.icons" },
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
}
