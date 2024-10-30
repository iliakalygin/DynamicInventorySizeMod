-- 1.1 --

-- data:extend({
--     {
--         type = "shortcut",
--         name = "dynamic_inventory_size_shortcut",
--         action = "lua",
--         toggleable = false,
--         icon = {
--             filename = "__DynamicInventorySize__/graphics/icon.png",
--             priority = "extra-high-no-scale",
--             size = 64,
--             scale = 1,
--             flags = {"icon"}
--         },
--         associated_control_input = "dynamic-inventory-size"
--     }
-- })


-- 2.0 --

data:extend({
    {
        type = "shortcut",
        name = "dynamic_inventory_size_shortcut",
        action = "lua",
        toggleable = false,
        icons = {
            {
                icon = "__DynamicInventorySize__/graphics/icon.png",
                icon_size = 64,
                icon_mipmaps = 4
            }
        },
        small_icons = {
            {
                icon = "__DynamicInventorySize__/graphics/small_icon.png",
                icon_size = 32,
                icon_mipmaps = 4
            }
        },
        associated_control_input = "dynamic-inventory-size"
    }
})
