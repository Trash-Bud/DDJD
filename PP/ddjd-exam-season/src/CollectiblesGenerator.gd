extends Node2D

var Score = preload("Score.tscn")
var MeleePU = preload("MeleePowerUp.tscn")
var RangedPU = preload("RangedPowerUp.tscn")
var SpeedPU = preload("SpeedPowerUp.tscn")

var rng = RandomNumberGenerator.new()

func _ready():
    rng.randomize()

func create_collectible(pos):
    var val = rng.randf()
    var col
    if (val <= 0.85): 
        var v = rng.randf()
        col = Score.instance()
        col.set_value(v)
    elif (val <= 0.90):
        col = MeleePU.instance()
    elif (val <= 0.95): 
        col = RangedPU.instance()
    else:
        col = SpeedPU.instance()
        
    col.position.y = pos.y
    col.position.x = pos.x
    return col
