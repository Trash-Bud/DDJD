extends Node2D

const BASE_DMG = 3
var dmg = 3
var curr_dir =  Direction.RIGHT

var proj = preload("res://Projectile.tscn")

var weapon_pos
var ready = true

func shoot(pos):
    if visible && ready:
        ready = false
        var projectile = proj.instance()
        projectile.dmg = dmg
        projectile.global_position = weapon_pos
        projectile.change_dir(pos,curr_dir)
        get_tree().get_root().get_node("Game/Projectiles").add_child(projectile)
        $BulletCooldown.start()
    

func show():
    visible = true

func hide():
    visible = false

func change_direction(dir):
    curr_dir = dir
    weapon_pos = $RotationPointRangedWeapon.change_direction(curr_dir)



func _on_BulletCooldown_timeout():
    ready = true
    $BulletCooldown.stop()


func _on_Player_ranged_weapon_power_up(val):
    dmg = val + BASE_DMG


func _on_RangedATKPowerUpTimer_timeout():
    dmg = BASE_DMG
