data:extend({
    {
        type = "shortcut",
        name = "mod_shortcut",
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

-- keyboard shortcut
data:extend({
  {
    type = "custom-input",
    name = "open_mod_dialog",
    key_sequence = "CONTROL + SHIFT + D",
    consuming = "none"
  }
})

require("prototypes.styles")