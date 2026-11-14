return {
	{
		"bufferline.nvim",
		event = "DeferredUIEnter",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
			{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
			{ "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
		},
		after = function()
			local showtabline = vim.opt.showtabline

			require("bufferline").setup({
				options = {
					close_command = function(n)
						Snacks.bufdelete(n)
					end,
					right_mouse_command = false,
					middle_mouse_command = "bdelete! %d",
					show_buffer_close_icons = false,
					diagnostics = "nvim_lsp",
					always_show_bufferline = true,
					offsets = { { filetype = "snacks_layout_box" } },
				},
			})

			vim.opt.showtabline = showtabline
		end,
	},
}
