extends Node2D

signal no_track

const SPAWN_DIST = 50

var rng = RandomNumberGenerator.new()
var MobEnemy = preload("res://MobEnemy.tscn")
var ThrowerEnemy = preload("res://ThrowerEnemy.tscn")
var player
var spawning = true

func _ready():
    rng.randomize()
    player = get_node("../Player")
    

func _on_Player_dead():
    emit_signal("no_track")


func _on_EnemyTimer_timeout():
    if not spawning:
        return
        
    var enemy
    if randf() < 0.95:
        enemy = MobEnemy.instance()
    else:
        enemy = ThrowerEnemy.instance()
    
    enemy.follow(player)
    connect("no_track", enemy, "_on_no_track")
    
    enemy.position.x = 0
    enemy.position.y =  rng.randi_range(-SPAWN_DIST,SPAWN_DIST)
    add_child(enemy)



func _on_HUB_start():
    var children = get_children()
    if children.size() != 0:
        for child in children:
            if child.get_class() != "Area2D":
                remove_child(child)
                child.queue_free()



func _on_Area2D_area_entered(area):
    print("entered")
    spawning = false
    

func _on_Area2D_area_exited(area):
    print("exited")
    spawning = true
