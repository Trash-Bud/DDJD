extends Camera2D

var player
var tracking = true

func _ready():
    player = get_node("../Player")

func _process(_delta):
    if tracking:
        if is_instance_valid(player):
            if player.position.x > 513.7 && player.position.x < 3961.1: 
                position.x = player.position.x
            position.y = player.position.y


func _on_Player_dead():
    tracking = false
