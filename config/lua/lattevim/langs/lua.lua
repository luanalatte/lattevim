return {
	servers = {
		lua_ls = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					hint = {
						arrayIndex = "Disable",
					},
				},
			},
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
	},
}
