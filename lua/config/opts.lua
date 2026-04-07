vim.cmd.colorscheme("rose-pine-main")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

vim.opt.nu = true
vim.opt.relativenumber = true

-- this will set tabs to 4 spaces instead of 8 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "0"

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.opt.colorcolumn = ""
	end,
})

vim.filetype.add({
	extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi" },
	filename = {
		["vifmrc"] = "vim",
	},
	pattern = {
		[".*/waybar/config"] = "jsonc",
		[".*/mako/config"] = "dosini",
		[".*/kitty/.+%.conf"] = "kitty",
		[".*/hypr/.+%.conf"] = "hyprlang",
		["%.env%.[%w_.-]+"] = "sh",
	},
})
vim.treesitter.language.register("bash", "kitty")

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
