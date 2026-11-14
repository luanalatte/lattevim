vim.lsp.config("*", {
	root_markers = { ".git" },
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lattevim.lsp-attach", { clear = true }),
	callback = function(ev)
		vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
		end

		map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
	end,
})

for server, config in pairs(require("lattevim.langs").servers()) do
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end
