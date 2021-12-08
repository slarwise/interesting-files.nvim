local M = {}

function M.get_interesting_files(locations)
    files = {}
    for _, location in ipairs(locations) do
        local f = io.open(location)
        if f then
            for line in f:lines() do
                table.insert(files, line)
            end
            f:close()
        end
    end

    if not next(files) then
        print(string.format("No files found in %s", locations))
        return
    end

    return files
end

return M
