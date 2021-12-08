local M = {}

function M.navigate(nr)
    local locations = M.config.locations

    io.input(locations)
    files = {}
    for line in io.lines() do
        table.insert(files, line)
    end

    if not next(files) then
        print(string.format("No files found in %s", locations))
        return
    end

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
