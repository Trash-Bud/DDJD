extends Area2D

const BASE_DMG = 4
var dmg = 4
var curr_dir = Direction.DOWN
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func attack():
    visible = true
    $CollisionShape2D.disabled = false
    $MeleeWeaponSprite.play()

func hit():
    return [dmg, curr_dir]

func change_direction(dir):
    curr_dir = dir
    match(curr_dir):
        Direction.RIGHT:
            rotation_degrees = 0
        Direction.RIGHT_UP:
            z_index = 0
            rotation_degrees = 315
        Direction.RIGHT_DOWN:
            z_index = 1
            rotation_degrees = 45
        Direction.LEFT:
            rotation_degrees = 180
        Direction.LEFT_UP:
            z_index = 0
            rotation_degrees = 225
        Direction.LEFT_DOWN:
            z_index = 1
            rotation_degrees = 135
        Direction.UP:
            z_index = 0
            rotation_degrees = 270
        Direction.DOWN:
            z_index = 1
            rotation_degrees = 90
    $MeleeWeaponSprite.change_dir(curr_dir)
            

func _on_MeleeWeaponSprite_animation_finished():
    $CollisionShape2D.disabled = true
    $MeleeWeaponSprite.stop()
    $MeleeWeaponSprite.frame = 0


func _on_Player_melee_weapon_power_up(val):
    dmg = BASE_DMG + val
    
func _on_MeleeATKPowerUpTimer_timeout():
    dmg = BASE_DMG
