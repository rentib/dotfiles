-- Silence warning about undefined-global
---@diagnostic disable-next-line: undefined-global
local swayimg = swayimg

-- Text overlay configuration
swayimg.text.font = "IosevkaTerm NFM" -- font name
swayimg.text.size = 24                -- font size in pixels
swayimg.text.color = 0xffcccccc       -- text color
swayimg.text.background = 0x00000000  -- background color
swayimg.text.shadow = 0x0d000000      -- shadow color

-- Gallery mode
swayimg.gallery.border_color = 0x00000000     -- border color for selected thumbnail
swayimg.gallery.unselected_color = 0x00000000 -- background color for unselected thumbnail
swayimg.gallery.embedded_thumb = true         -- use embedded thumbnails

-- Keybids:
-- Viewer:
swayimg.viewer.on_key("Escape",       swayimg.exit)
swayimg.viewer.on_key("q",            swayimg.exit)
swayimg.viewer.on_key("Return",       function() swayimg.mode = "gallery" end)
swayimg.viewer.on_key("f",            function() swayimg.fullscreen = not swayimg.fullscreen end)
swayimg.viewer.on_key("g",            function() swayimg.viewer.open("first") end)
swayimg.viewer.on_key("Shift+g",      function() swayimg.viewer.open("last") end)
swayimg.viewer.on_key("p",            function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("n",            function() swayimg.viewer.open("next") end)
swayimg.viewer.on_key("r",            swayimg.viewer.reload)
swayimg.viewer.on_key("h",            function() swayimg.viewer.set_abs_position(swayimg.viewer.get_position().x + 20, swayimg.viewer.get_position().y) end)
swayimg.viewer.on_key("j",            function() swayimg.viewer.set_abs_position(swayimg.viewer.get_position().x, swayimg.viewer.get_position().y - 20) end)
swayimg.viewer.on_key("k",            function() swayimg.viewer.set_abs_position(swayimg.viewer.get_position().x, swayimg.viewer.get_position().y + 20) end)
swayimg.viewer.on_key("l",            function() swayimg.viewer.set_abs_position(swayimg.viewer.get_position().x - 20, swayimg.viewer.get_position().y) end)
swayimg.viewer.on_key("Shift+j",      function() swayimg.viewer.set_abs_scale(swayimg.viewer.scale * (1 - 0.05)) end)
swayimg.viewer.on_key("Shift+k",      function() swayimg.viewer.set_abs_scale(swayimg.viewer.scale * (1 + 0.05)) end)
swayimg.viewer.on_key("b",            function() os.execute("setbg " .. swayimg.viewer.get_image().path) end)
swayimg.viewer.on_key("y",            function() os.execute(os.getenv("HOME") .. "/.config/swayimg/exec_copy_image " .. swayimg.viewer.get_image().path) end)
swayimg.viewer.on_key("Shift+Delete", function()
    os.remove(swayimg.viewer.get_image())
    swayimg.viewer.open("next")
end)

-- Gallery:
swayimg.gallery.on_key("Escape",       swayimg.exit)
swayimg.gallery.on_key("q",            swayimg.exit)
swayimg.gallery.on_key("Return",       function() swayimg.mode = "viewer" end)
swayimg.gallery.on_key("f",            function() swayimg.fullscreen = not swayimg.fullscreen end)
swayimg.gallery.on_key("g",            function() swayimg.gallery.select("first") end)
swayimg.gallery.on_key("Shift+g",      function() swayimg.gallery.select("last") end)
swayimg.gallery.on_key("h",            function() swayimg.gallery.select("left") end)
swayimg.gallery.on_key("j",            function() swayimg.gallery.select("down") end)
swayimg.gallery.on_key("k",            function() swayimg.gallery.select("up") end)
swayimg.gallery.on_key("l",            function() swayimg.gallery.select("right") end)
swayimg.gallery.on_key("b",            function() os.execute("setbg " .. swayimg.gallery.get_image().path) end)
swayimg.gallery.on_key("y",            function() os.execute(os.getenv("HOME") .. "/.config/swayimg/exec_copy_image " .. swayimg.gallery.get_image().path) end)
swayimg.gallery.on_key("Shift+Delete", function()
    os.remove(swayimg.gallery.get_image().path)
    swayimg.gallery.select("next")
end)
