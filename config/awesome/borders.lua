local awful = require("awful")
local naughty = require("naughty")

local smart_borders = require("third_party.smart_borders")

smart_borders {
    show_button_tooltips = true,

    button_positions = { "top" },
    buttons = { "floating", "minimize", "maximize", "close" },

    layout = "fixed",
    align_horizontal = "center",
    button_size = 40,
    button_floating_size = 60,
    button_close_size = 60,
    border_width = 1,

    color_close_normal = {
        type = "linear",
        from = { 0, 0 },
        to = { 60, 0 },
        stops = { { 0, "#fd8489" }, { 1, "#56666f" } }
    },
    color_close_focus = {
        type = "linear",
        from = { 0, 0 },
        to = { 60, 0 },
        stops = { { 0, "#fd8489" }, { 1, "#a1bfcf" } }
    },
    color_close_hover = {
        type = "linear",
        from = { 0, 0 },
        to = { 60, 0 },
        stops = { { 0, "#FF9EA3" }, { 1, "#a1bfcf" } }
    },
    color_floating_normal = {
        type = "linear",
        from = { 0, 0 },
        to = { 40, 0 },
        stops = { { 0, "#56666f" }, { 1, "#ddace7" } }
    },
    color_floating_focus = {
        type = "linear",
        from = { 0, 0 },
        to = { 40, 0 },
        stops = { { 0, "#a1bfcf" }, { 1, "#ddace7" } }
    },
    color_floating_hover = {
        type = "linear",
        from = { 0, 0 },
        to = { 40, 0 },
        stops = { { 0, "#a1bfcf" }, { 1, "#F7C6FF" } }
    },

    snapping = true,
    snapping_center_mouse = false,

    -- custom control example:
    button_back = function(c)
        -- set client as master
        c:swap(awful.client.getmaster())
    end,

    -- hot_corners
    hot_corners_color = "#00000000",
    -- hot_corners_color = "#FD8489",
    hot_corners_width = 1,
    hot_corners_height = 1,
    hot_corners = {
        ["top_right"] = {
            enter = function()
                local c = client.focus
                c.fullscreen = not c.fullscreen
            end,
        },
        ["top_left"] = {
            enter = function()
                naughty.notify({ text = "enter" })
            end,
            left_click = function()
                naughty.notify({ text = "left" })
            end,
        },
    },
}
