local interesting_files = {}

function interesting_files.navigate(nr)
    io.input(interesting_files.config.locations)
    files = {}
    for line in io.lines() do
        table.insert(files, line)
    end

    if not next(files) then
        print("No files found in ./interesting-files")
        return
    end

    if nr > #files then
        print(string.format("There are only %s interesting files", #files))
        return
    end

    local file = files[nr]
    pcall(vim.cmd, string.format("edit %s", file))
end

function interesting_files.setup(opts)
    opts = opts or {}
    config = {}
    if opts.locations then
        assert(type(opts.locations) == "string", "opts.locations must be a string")
        config.locations = opts.locations
    else
        config.locations = "./interesting-files"
    end

    interesting_files.config = config
end

return interesting_files
