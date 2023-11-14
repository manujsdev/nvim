local ok, colorizer = pcall(require, "colorizer")
if not ok then
	return
end

-- you can add other filetypes
colorizer.setup({
	"scss",
	"css",
	"html",
	"javascript",
	"typescript",
	"svelte",
	html = {
		mode = "foreground",
	},
})
