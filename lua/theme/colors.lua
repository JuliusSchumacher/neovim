local home = os.getenv('HOME')

-- see if the file exists
local function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
local function lines_from(file)
    if not file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do lines[#lines + 1] = line end
    return lines
end

local from_theme = lines_from(home .. '/.cache/wal/colors')

local colors = {
    fg = from_theme[8],
    bg = from_theme[1],
    red = from_theme[2],
    green = from_theme[3],
    yellow = from_theme[4],
    cyan = from_theme[6],
    blue = from_theme[5],
    magenta = from_theme[7]
}

return colors
