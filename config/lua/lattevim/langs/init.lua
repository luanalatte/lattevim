local M = {}

local cache

local function load()
	if cache then
		return cache
	end

	cache = { servers = {}, formatters_by_ft = {}, linters_by_ft = {} }

	local files = vim.api.nvim_get_runtime_file("lua/lattevim/langs/*.lua", true)
	for _, path in ipairs(files) do
		local name = vim.fn.fnamemodify(path, ":t:r")
		if name ~= "init" then
			local spec = require("lattevim.langs." .. name)
			if spec["enabled"] or true then
				for key in pairs(cache) do
					cache[key] = vim.tbl_deep_extend("force", cache[key], spec[key] or {})
				end
			end
		end
	end

	return cache
end

function M.servers()
	return load().servers
end

function M.formatters_by_ft()
	return load().formatters_by_ft
end

function M.linters_by_ft()
	return load().linters_by_ft
end

return M
