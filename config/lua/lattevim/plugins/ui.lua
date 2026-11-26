return {
	{ "nui.nvim" },
	{
		"noice.nvim",
		event = "DeferredUIEnter",
		before = function()
			require("lz.n").trigger_load("nui.nvim")
		end,
		after = function()
			require("noice").setup({
				cmdline = {
					enabled = true,
					view = "cmdline_popup",
				},
				presets = {
					-- bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					lsp_doc_border = true,
				},
			})
		end,
	},
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
	{
		"lualine.nvim",
		lazy = false,
		after = function()
			require("lualine").setup({
				options = {
					globalstatus = vim.o.laststatus == 3,
					component_separators = "",
					section_separators = { left = "", right = "" },
					disabled_filetypes = { statusline = { "snacks_dashboard" } },
				},
				sections = {
					lualine_c = {},
					lualine_x = { "filetype" },
					lualine_y = {},
				},
			})
		end,
	},
	{
		"which-key.nvim",
		event = "DeferredUIEnter",
		after = function()
			require("which-key").setup({
				preset = "helix",
				spec = {
					{ "<leader>b", group = "buffer" },
					{ "<leader>c", group = "code" },
					{ "<leader>f", group = "file/find" },
					{ "<leader>g", group = "git" },
					{ "<leader>gh", group = "hunks" },
					{ "<leader>u", group = "ui" },
					{ "<leader>q", group = "quit/session" },
					{ "<leader>w", group = "windows" },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "goto" },
					{ "z", group = "fold" },
					-- better descriptions
					{ "gx", desc = "Open with system app" },
				},
			})
		end,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Keymaps",
			},
		},
	},
}
