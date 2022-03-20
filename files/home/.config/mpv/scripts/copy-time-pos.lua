require "mp"
require "mp.msg"

local function divmod(a, b)
    return a / b, a % b
end

local function get_timestamp()
    local time_pos = mp.get_property_number("time-pos")
    local m, r = divmod(time_pos, 60)
    local h, m = divmod(m, 60)
    local s = math.floor(r)
    local ms = math.floor((r - s) * 1000)
    return string.format("%02d:%02d:%02d.%03d", h, m, s, ms)
end

local function copy_to_clipboard(text)
    local pipe = io.popen("wl-copy", "w")
    pipe:write(text)
    pipe:close()
end

local function main()
    local time = get_timestamp()
    copy_to_clipboard(time)
    mp.osd_message(string.format("Copied: %s", time))
end

mp.add_key_binding("y", nil, main)
