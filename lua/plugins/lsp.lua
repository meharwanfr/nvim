return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {},
		config = function()
			require("tree-sitter-manager").setup({})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },

					python = { "isort", "black" },

					rust = { "rustfmt", lsp_format = "fallback" },

					javascript = { "prettierd", "prettier", stop_after_first = true },
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {

						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("css-lsp")
			vim.lsp.enable("cssls")

			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {},
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",

		dependencies = { "rafamadriz/friendly-snippets" },

		version = "1.*",

		opts = {

			keymap = {
				preset = "default",
				["<CR>"] = { "select_and_accept", "fallback" },
			},

			appearance = {

				nerd_font_variant = "mono",
			},

			completion = { documentation = { auto_show = false } },

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
