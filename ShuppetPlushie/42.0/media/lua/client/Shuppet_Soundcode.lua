local function onKeyPressed(key)
    local player = getPlayer()
    if key == getCore():getKey("Shout") then
        if player:getInventory():contains("Plushie_Shuppet") then
            getSoundManager():PlayWorldSound('ShuppetShout', player:getSquare(), 0, 25, 5, false);  
            addSound(player, player:getX(), player:getY(), player:getZ(), 25, 0.5)
        end
        return key
    end
end

Events.OnKeyPressed.Add(onKeyPressed)