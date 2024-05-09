extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
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
        play("down_right")
    elif dir[0] > 0 && dir[1] < 0:
        play("up_right")
    elif dir[0] < 0 && dir[1] > 0:
        play("down_left")
    elif dir[0] < 0 && dir[1] < 0:
        play("up_left")

