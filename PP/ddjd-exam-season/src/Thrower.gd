extends KinematicBody2D

export (PackedScene) var to_follow
export var speed = 2000
export var hover_distance = 500
var min_running_distance = 30
var health = 5
var following = false
signal dead_thrower
var Projectile = preload("res://Projectile.tscn")
var invencible = false
# Called when the node enters the scene tree for the first time.
func _ready():
    $ThrowerSprite.playing = true
    $AnimationPlayer.play("stop")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
func _physics_process(delta):
    if following:
        var dir = (to_follow.global_position - global_position).normalized()
        var distance = global_position.distance_to(to_follow.global_position)
        if abs(distance - hover_distance) < min_running_distance:
            return
        if distance < hover_distance:
            dir = -dir
        $ThrowerSprite.change_direction(dir)
        move_and_slide(dir * speed * delta)


func _on_HurtBox_area_entered(area):
    if not invencible:
        var res = area.hit()
        health -= res[0]
        if health <= 0:
            emit_signal("dead_thrower",position)
            queue_free()
        else:
            if res[1] != null:
                knock_back(res[1])
                blink()
    
    
func knock_back(dir):
    var kb
    match(dir):
        Direction.RIGHT:
            kb = Vector2(1,0)
        Direction.LEFT:
            kb = Vector2(-1,0)
        Direction.DOWN:
            kb = Vector2(0,1)
        Direction.UP:
            kb = Vector2(0,-1)
        Direction.RIGHT_DOWN:
            kb = Vector2(1,1)
        Direction.RIGHT_UP:
            kb = Vector2(1,-1)
        Direction.LEFT_DOWN:
            kb = Vector2(-1,1)
        Direction.LEFT_UP:
            kb = Vector2(-1,-1)
            
    move_and_slide(kb * 5000)

func _on_ShootTimer_timeout():
    if not following:
        return
        
    var shot = Projectile.instance()
    shot.paper_ball()
    shot.SPEED = 100
    shot.enemy = true
    var direction = (to_follow.global_position - global_position).normalized()
    $ThrowerSprite.change_direction(direction)
    shot.global_position = global_position + direction * 100
    shot.direction = direction
    get_tree().get_root().get_node("Game/Projectiles").add_child(shot)


func blink():
    invencible = true
    $InvencibilityTimer.start()
    $AnimationPlayer.play("blink")


func _on_InvencibilityTimer_timeout():
    invencible = false
    $InvencibilityTimer.stop()
    $AnimationPlayer.play("stop")
