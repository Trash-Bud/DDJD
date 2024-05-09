extends KinematicBody2D

export (PackedScene) var to_follow
export var speed = 3000
var health = 10
var following = false
signal dead_mob
var invencible = false

# Called when the node enters the scene tree for the first time.
func _ready():
    $AnimationPlayer.play("stop")
    $MobSprite.playing = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
func _physics_process(delta):
    if following && not invencible:
        var dir = (to_follow.global_position - global_position).normalized()
        $MobSprite.change_direction(dir)
        var velocity = move_and_slide(dir * speed * delta)


func _on_HurtBox_area_entered(area):
    if not invencible:
        var res = area.hit()
        health -= res[0]
        if health <= 0:
            emit_signal("dead_mob", position)
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
 

func blink():
    invencible = true
    $InvencibilityTimer.start()
    $AnimationPlayer.play("blink")


func _on_VisibilityEnabler2D_screen_exited():
    visible = false


func _on_VisibilityEnabler2D_screen_entered():
    visible = true


func _on_InvencibilityTimer_timeout():
    invencible = false
    $InvencibilityTimer.stop()
    $AnimationPlayer.play("stop")
