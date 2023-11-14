local ok, project = pcall(require, "project_nvim")
if not ok then
	return
end

project.setup({})

local ok_telescope, telescope = pcall(require, "telescope")
if not ok_telescope then
	return
end

telescope.load_extension("projects")
