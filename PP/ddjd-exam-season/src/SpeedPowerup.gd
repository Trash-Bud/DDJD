extends Area2D

func pick_up():
    queue_free()
    return [CollectibleType.SPEED, 200]
