local ok, alpha = pcall(require, "alpha")

if not ok then
	return
end

local ok_dashboard, dashboard = pcall(require, "alpha.themes.dashboard")

if not ok_dashboard then
	return
end

-- Set header
dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("a", "  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("ff", "  > Find file", ":Telescope find_files<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("fg", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("c", "  Settings", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
