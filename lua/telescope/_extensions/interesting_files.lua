local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
  error('This plugins requires nvim-telescope/telescope.nvim')
end

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"

local interesting_files = function(opts)
    opts = opts or {}

    io.input("interesting-files")
    files = {}
    for line in io.lines() do
        table.insert(files, line)
    end

    if not next(files) then
        print("No files found in interesting-files")
        return
    end

    pickers.new(opts, {
        prompt_title = "Args",
        finder = finders.new_table {
            results = files,
        },
        previewer = conf.grep_previewer(opts),
        sorter = conf.generic_sorter(opts),
    }):find()
end

return telescope.register_extension {
    exports = { interesting_files = interesting_files },
}
