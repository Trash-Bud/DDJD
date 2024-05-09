extends Node2D

func follow(player):
    $Thrower.to_follow = player
    $Thrower.following = true

func _on_no_track():
    if $Thrower:
        $Thrower.following = false


func _on_Thrower_dead_thrower(pos):
    var drop = CollectiblesGenerator.create_collectible(pos)
    add_child(drop)
