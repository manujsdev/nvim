-- local colorscheme = "gruvbox"
local colorscheme = "gruvbox-material"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark" -- or "light" for light mode

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

if not ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
