local utils = require "interesting_files.utils"
local M = {}

function M.navigate(nr)
    local locations = M.config.locations

    local files = utils.get_interesting_files(locations)

    if nr > #files then
        print(string.format("There are only %s interesting files", #files))
        return
    end

    local file = files[nr]
    pcall(vim.cmd, string.format("edit %s", file))
end

function M.setup(opts)
    opts = opts or {}
    config = {}
    if opts.locations then
        assert(type(opts.locations) == "string", "opts.locations must be a string")
        config.locations = opts.locations
    else
        config.locations = "interesting-files"
    end

    M.config = config
end

return M
