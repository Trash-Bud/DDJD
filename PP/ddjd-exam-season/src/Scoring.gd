extends Node

signal new_stage
var curr_stage = 0
var score = 0
var hub

func _ready():
    hub = get_node("../HUB")

func _on_Player_pickup_coin(val):
    score += val
    hub.update_score(score)
    if val / 20 > curr_stage:
        curr_stage += 1
        emit_signal("new_stage",curr_stage)     



func _on_HUB_start():
    score = 0


