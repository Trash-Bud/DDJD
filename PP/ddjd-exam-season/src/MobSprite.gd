extends AnimatedSprite


func _ready():
    pass # Replace with function body.


func change_direction(dir):
    if dir[0] > 0 && dir[1] < 0.5 && dir[1] > -0.5:
        play("right")
    elif dir[0] < 0 && dir[1] < 0.5 && dir[1] > -0.5:
        play("left")
    elif dir[0] < 0.5 && dir[0] > -0.5 && dir[1] > 0:
        play("down")
    elif dir[0] < 0.5 && dir[0] > -0.5 && dir[1] < 0:
        play("up")
    elif dir[0] > 0 && dir[1] > 0:
        play("right down")
    elif dir[0] > 0 && dir[1] < 0:
        play("right up")
    elif dir[0] < 0 && dir[1] > 0:
        play("left down")
    elif dir[0] < 0 && dir[1] < 0:
        play("left up")

