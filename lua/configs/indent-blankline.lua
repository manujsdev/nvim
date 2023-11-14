local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
	return
end

indent_blankline.setup({
	-- show_end_of_line = true,
	-- space_char_blankline = " ",
	show_current_context = true,
	-- show_current_context_start = true,
	-- char_highlight_list = {
	--   "IndentBlanklineIndent1",
	--   "IndentBlanklineIndent2",
	--   "IndentBlanklineIndent3",
	-- },
})
