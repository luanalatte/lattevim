vim.lsp.config("*", {
	root_markers = { ".git" },
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lattevim.lsp-attach", { clear = true }),
	callback = function(ev)
		vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})

for server, config in pairs(require("lattevim.langs").servers()) do
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end
