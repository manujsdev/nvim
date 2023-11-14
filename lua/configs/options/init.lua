local options = {
	number = true, -- show line numbers
	relativenumber = true, -- Show the line number relative to the line with the cursor in front of each line
	cursorline = true, -- highlight the current line
	tabstop = 2, -- Number of spaces that a <Tab> in the file counts for
	shiftwidth = 2, -- Number of spaces to use for each step of (auto)indent
	expandtab = true, -- Use the appropriate number of spaces to insert a <Tab>
	backup = false, -- disabled the creation of backups
	cmdheight = 2, -- Number of screen lines to use for the command-line
	fileencoding = "utf-8", -- File-content encoding for the current buffer
	hlsearch = true, -- When there is a previous search pattern, highlight all its matches
	showmatch = true, -- When a bracket is inserted, briefly jump to the matching one
	termguicolors = true, -- Enables 24-bit RGB color
	showmode = false, -- we don't need show mode because we see in the lualine statusline (Insert, Visual, etc)
	mouse = "a", -- mouse support for all modes
	clipboard = "unnamedplus", -- allow to access the system clipboard
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- or this:
-- local my_options = vim.opt
-- my_options.number = true
-- my_options.relativenumber = true
-- my_options.cursorline = true
-- my_options.tabstop = 2
-- my_options.shiftwidth = 2
-- my_options.expandtab = true
-- my_options.backup = false
-- my_options.cmdheight = 2
-- my_options.fileencoding = "utf-8"
-- my_options.hlsearch = true
-- my_options.showmatch = true
-- my_options.termguicolors = true
-- my_options.showmode = false
-- my_options.mouse = "a"
-- my_options.clipboard = "unnamedplus"
