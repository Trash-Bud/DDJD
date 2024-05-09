extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.



func change_dir(dir):
        match(dir):
            Direction.RIGHT:
                flip_h = false
                flip_v = false
            Direction.RIGHT_UP:
                flip_v = false
                flip_h = false

            Direction.RIGHT_DOWN:
                flip_v = true
                flip_h = false

            Direction.LEFT:
                flip_h = false
                flip_v = true

            Direction.LEFT_UP:
                flip_h = false
                flip_v = true

            Direction.LEFT_DOWN:
                flip_h = false
                flip_v = true

            Direction.UP:
                flip_v = false
                flip_h = false

            Direction.DOWN:
                flip_v = true
                flip_h = false

    

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
