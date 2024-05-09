extends Area2D

func pick_up():
    queue_free()
    return [CollectibleType.MELEE_ATK_UP, 4]
