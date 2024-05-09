extends AnimatedSprite

func turn(dir):
    match(dir):
            Direction.DOWN	:
                play("down")
            Direction.UP	:
                play("up")
            Direction.RIGHT	:
                play("right")
            Direction.LEFT	:
                play("left")
            Direction.RIGHT_UP	:
                play("up right")
            Direction.LEFT_UP	:
                play("up left")
            Direction.RIGHT_DOWN	:
                play("down right")
            Direction.LEFT_DOWN	:
                play("down left")
    
func walk(dir):
    match(dir):
            Direction.DOWN	:
                play("down") # missing animation
            Direction.UP	:
                play("up") # missing animation
            Direction.RIGHT	:
                play("walk right")
            Direction.LEFT	:
                play("walk left")
            Direction.RIGHT_UP	:
                play("up right") # missing animation
            Direction.LEFT_UP	:
                play("up left") # missing animation
            Direction.RIGHT_DOWN	:
                play("down right") # missing animation
            Direction.LEFT_DOWN	:
                play("down left") #
    
