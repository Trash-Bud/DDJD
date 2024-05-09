extends Node

var Score = preload("Score.tscn")
var rng = RandomNumberGenerator.new()


func create_coin(position):
    var col = Score.instance()
    
    var y = position.y
    var x = position.x

    var value = rng.randf_range(0,1)

    col.set_value(value)

    col.position.y = y
    col.position.x = x
    add_child(col)
    


