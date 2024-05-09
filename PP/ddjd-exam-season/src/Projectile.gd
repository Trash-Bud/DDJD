extends Area2D

class_name Projectile

var SPEED = 200
var dmg = 3
var curr_dir
var direction
var enemy = false

func _physics_process(delta):
    var movement = direction * SPEED * delta
    global_position += movement

func change_dir(dir, cur_dir):
    curr_dir = cur_dir
    direction = dir.normalized()

func paper_ball():
    $AnimatedSprite.visible = false
    $Sprite.visible = true
    $AnimationPlayer.play("rotate projectile")


func destroy():
    queue_free()

func hit():
    destroy()
    return [dmg, curr_dir]

func _on_VisibilityNotifier2D_screen_exited():
    destroy()
