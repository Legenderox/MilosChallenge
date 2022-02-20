function collide_check(player, box)
    return player.pos.x < box.pos.x + box.width and
        player.pos.x + player.width > box.pos.x and
        player.pos.y < box.pos.y + box.height and
        player.pos.y + player1.height > player2.y
end
