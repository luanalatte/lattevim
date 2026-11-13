return {
	{
		"catppuccin-nvim",
		lazy = false,
		priority = 1000,
		after = function()
			---@type CatppuccinOptions
			local opts = {
				flavour = "auto",
				background = {
					light = "latte",
					dark = "mocha",
				},
				term_colors = false,
				integrations = {
					snacks = { enabled = true },
				},
			}

			require("catppuccin").setup(opts)

			vim.cmd.colorscheme("catppuccin-nvim")
		end,
	},
}
