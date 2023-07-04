local awful = require("awful")
local naughty = require("naughty")

local pid, err = awful.spawn.easy_async("autostart.sh",
    function(stdout, stderr, exitreason, exitcode)
        naughty.notify({
            preset = naughty.config.presets.info,
            title = "Executing autostart.sh",
        })
        if exitcode ~= 0 then
            naughty.notify({
                preset = naughty.config.presets.warn,
                title = "Error executing autostart.sh",
                text = "stdout: " .. stdout .. "\nstderr: " .. stderr
            })
            return
        end
    end
)

if not pid then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Executing autostart.sh",
        text = err,
    })
end