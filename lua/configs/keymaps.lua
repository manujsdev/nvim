local opt = { silent = true }

function Keymap(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- toggle file explorer
Keymap("n", "<S-e>", ":Lexplore 25<cr>")

-- Select all content in the file
Keymap("", "<C-a>", "gg<S-v>G", opt)

-- Move text up and down
Keymap("v", "<C-j>", ":m .+1<CR>==", opt)
Keymap("v", "<C-k>", ":m .-2<CR>==", opt)
-- Stay in indent mode
Keymap("v", "<", "<gv", opt)
Keymap("v", ">", ">gv", opt)

-- nvim-tree toggle (open/close with Shift + e)
Keymap("n", "<S-e>", ":NvimTreeToggle<cr>", opt)

-- change of window (example: when you are open nvim-tree, or you are splitted the window)
Keymap("n", "<C-h>", "<C-w>h", opt)
Keymap("n", "<C-j>", "<C-w>j", opt)
Keymap("n", "<C-k>", "<C-w>k", opt)
Keymap("n", "<C-l>", "<C-w>l", opt)

-- Move to buffer next or previous (Shift + l or Shift + h)
Keymap("n", "<S-l>", ":bnext<CR>", opt)
Keymap("n", "<S-h>", ":bprevious<CR>", opt)

-- Telescope keymaps
Keymap("n", "ff", "<cmd>Telescope find_files<cr>", opt) -- find files
Keymap("n", "fg", "<cmd>Telescope live_grep<cr>", opt) -- find words
Keymap("n", "fb", "<cmd>Telescope buffers<cr>", opt) -- find opened buffers (tabs)

-- Duplicate a line
Keymap("n", "<C-d>", "yyp", opt)
