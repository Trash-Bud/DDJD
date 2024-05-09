extends Area2D

func pick_up():
    queue_free()
    return [CollectibleType.RANGE_ATK_UP, 3]
