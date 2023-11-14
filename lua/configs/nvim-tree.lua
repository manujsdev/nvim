local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvim_tree.setup({
	view = {
		width = 35,
	},
	renderer = {
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					untracked = "U",
				},
			},
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
})
