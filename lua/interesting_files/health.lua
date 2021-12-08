local M = {}
local health = require("health")
local interesting_files = require "interesting_files"

M.check = function()
    health.report_start("interesting-files report")

    local locations = interesting_files.config.locations

    local non_existent_files = {}
    for _, location in ipairs(locations) do
        f = io.open(location)
        if not f then
            table.insert(non_existent_files, location)
        else
            f:close()
        end
    end

    if next(non_existent_files) then
        health.report_warn(
            string.format("the following files were not found: %s",
                table.concat(non_existent_files, ", ")
            )
        )
    else
        health.report_ok("no issues found")
    end
end

return M
