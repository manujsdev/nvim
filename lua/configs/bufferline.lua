local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

bufferline.setup({
	options = {
		numbers = "ordinal",
		offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
	},
})
