return {
	{
		"ngtuonghy/live-server-nvim",
		event = "VeryLazy",
		build = ":LiveServerInstall",
		config = function()
			require("live-server-nvim").setup({
				custom = {
					"--port=8080",
					"--no-css-inject",
				},
				serverPath = vim.fn.stdpath("data") .. "/live-server/", --default
				open = "folder", -- folder|cwd     --default
			})
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"nvim-mini/mini.icons",
		version = false,
		config = function()
			require("mini.icons").setup({})
		end,
	},
	{
		"supermaven-inc/supermaven-nvim",
		enable = false,
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<C-f>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-n>",
				},
				ignore_filetypes = { cpp = true },
				color = {
					suggestion_color = "#ffffff",
					cterm = 244,
				},
				log_level = "info",
				disable_inline_completion = false,
				disable_keymaps = false,
				condition = function()
					return false
				end,
			})
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true })
		end,
	},
}
