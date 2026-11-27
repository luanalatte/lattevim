return {
	servers = {
		phpactor = {},
	},
	formatters_by_ft = {
		php = { "pint", "php_cs_fixer", stop_after_first = true },
		blade = { "blade-formatter" },
	},
	linters_by_ft = {
		php = { "phpcs" },
	},
}
