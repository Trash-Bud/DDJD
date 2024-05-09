extends Node2D

func follow(player):
    $Mob.to_follow = player
    $Mob.following = true

func _on_no_track():
    if $Mob:
        $Mob.following = false

func _on_Mob_dead_mob(pos):
    var drop = CollectiblesGenerator.create_collectible(pos)
    add_child(drop)


func _on_MobEnemy_child_exiting_tree(node):
    if get_children().size() == 0:
        queue_free()
