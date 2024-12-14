local function create_inventory_gui(player)
    if player.gui.screen.mod_main_frame then
        player.gui.screen.mod_main_frame.destroy()
    end

    -- main frame
    local frame = player.gui.screen.add {
        type = "frame",
        name = "mod_main_frame",
        caption = "Adjust Inventory Size",
        visible = true,
        direction = "vertical"
    }

    frame.auto_center = true

    -- inner frame
    local innerFrame = frame.add {
        type = "frame",
        name = "innerFrame",
        direction = "vertical",
        style = "inside_shallow_frame",
    }

    -- properties table to the inner frame
    local propertiesTable = innerFrame.add {
        type = "table",
        name = "propertiesTable1",
        column_count = 2,
        style = "property-table",
    }

    -- inventory size label
    propertiesTable.add {
        type = "label",
        caption = "New Inventory Size: ",
        style = "semibold_caption_label"
    }

    -- inventory size textfield
    propertiesTable.add {
        type = "textfield",
        name = "inventory_size_textfield",
        numeric = true,
        allow_decimal = false,
        style = "short_number_textfield",
    }

    -- bottom row buttons
    local actionsFlow = frame.add {
        type = "flow",
        style = "dialog_buttons_horizontal_flow",
    }

    -- cancel button
    actionsFlow.add {
        type = "button",
        name = "close_button",
        style = "back_button",
        caption = "Cancel",
    }

    -- confirm button
    actionsFlow.add {
        type = "button",
        name = "confirm_button",
        style = "confirm_button",
        caption = "Confirm",
    }
end

-- event handler for when the player uses the shortcut
script.on_event(defines.events.on_lua_shortcut, function(event)
    if event.prototype_name == "mod_shortcut" then
        local player = game.get_player(event.player_index)
        create_inventory_gui(player)
    end
end)

-- event handler for the keyboard shortcut
script.on_event("open_mod_dialog", function(event)
    local player = game.get_player(event.player_index)
    if player then
        create_inventory_gui(player)
    end
end)

-- event handler for gui interaction
script.on_event(defines.events.on_gui_click, function(event)
    local player = game.get_player(event.player_index)
    if not player then return end

    -- handle confirm button
    if event.element.name == "confirm_button" then
        local frame = player.gui.screen.mod_main_frame
        if not frame then return end

        -- access the text field
        local textfield = frame.innerFrame.propertiesTable1.inventory_size_textfield
        if not textfield then
            player.print("Error: Text field not found!")
            return
        end

        -- validate and set the new inventory size
        local new_size = tonumber(textfield.text)
        if new_size and new_size >= 0 then 
            player.character_inventory_slots_bonus = new_size
            frame.destroy()
        else
            player.print("Invalid inventory size") 
        end

    -- handle cancel button
    elseif event.element.name == "close_button" then
        local frame = player.gui.screen.mod_main_frame
        if frame then
            frame.destroy()
        end
    end
end)
