
extends Area2D

var tex1 = load("res://assets/score_sprites/1euro.png")
var tex2 = load("res://assets/score_sprites/2euro.png")
var tex3 = load("res://assets/score_sprites/5euro.png")
var tex4 = load("res://assets/score_sprites/10euro.png")
var tex5 = load("res://assets/score_sprites/20euro.png")
var value = 0


func _ready():
    pass 

func pick_up():
    queue_free()
    return [CollectibleType.SCORE, value]

func set_value(val):
    var f_value = 0
    if (val <= 0.5): # 50% chance
        $Sprite.texture = tex1
        f_value = 1
    elif (val <= 0.7): # 20% chance
        $Sprite.texture = tex2
        f_value = 2
    elif (val <= 0.85): # 15% chance
        $Sprite.texture = tex3
        f_value = 5
    elif (val <= 0.95): # 10% chance
        $Sprite.texture = tex4
        f_value = 10
    else: # 5% chance
        $Sprite.texture = tex5
        f_value = 20
    value = f_value
    
