function collide_check(player, prop)
    return player.pos.x < prop.pos.x + prop.width and
        player.pos.x + player.width > prop.pos.x and
        player.pos.y < prop.pos.y + prop.height and
        player.pos.y + player.height > prop.pos.y
end

function is_above(player, prop)
    if player.pos.y + player.height <= prop.pos.y then return true end
    return false
end

function is_below(player, prop)
    if player.pos.y + player.height >= prop.pos.y + prop.height then return true end
    return false
end