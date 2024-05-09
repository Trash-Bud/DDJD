extends Node

var full_heart = load("res://assets/health/full_heart.png")
var empty_heart = load("res://assets/health/empty_heart.png")

func hit(new_health):
    for hp in range(1, 6):
        if hp <= new_health:
            get_node("Heart"+str(hp)).texture = full_heart
        else:
            get_node("Heart"+str(hp)).texture = empty_heart

func reset():
    for hp in range(1, 6):
        get_node("Heart"+str(hp)).texture = full_heart
