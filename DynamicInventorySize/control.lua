local function create_inventory_gui(player)
    if player.gui.center.dynamic_inventory_size_frame then
        player.gui.center.dynamic_inventory_size_frame.destroy()
    end


local frame = player.gui.center.add {
        type = "frame",
        name = "dynamic_inventory_size_frame",
        direction = "vertical"
    }

    frame.add {
        type = "textfield",
        name = "dynamic_inventory_size_textfield"
    }

    frame.add {
        type = "button",
        name = "dynamic_inventory_size_button",
        caption = "Set Inventory Size"
    }
    frame.add {
        type = "button",
        name = "dynamic_inventory_close_button",
        caption = "Close"
    }
end

-- Event handler for when the player uses the shortcut
script.on_event(defines.events.on_lua_shortcut, function(event)
    if event.prototype_name == "dynamic_inventory_size_shortcut" then
        local player = game.get_player(event.player_index)
        create_inventory_gui(player)
    end
end)

-- Event handler for GUI interaction
script.on_event(defines.events.on_gui_click, function(event)
    if event.element.name == "dynamic_inventory_size_button" then
        local player = game.get_player(event.player_index)
        local frame = player.gui.center.dynamic_inventory_size_frame
        local textfield = frame.dynamic_inventory_size_textfield

        local new_size = tonumber(textfield.text)
        if new_size and new_size >= 0 then 
            player.character_inventory_slots_bonus = new_size
            frame.destroy()
        else
            player.print("Invalid inventory size") 
        end
    elseif event.element.name == "dynamic_inventory_close_button" then
        local player = game.get_player(event.player_index)
        local frame = player.gui.center.dynamic_inventory_size_frame
        if frame then
            frame.destroy()
        end

    end
end)