extends Node2D

var sprite_pos

func change_direction(dir):
    match(dir):
        Direction.RIGHT:
            rotation_degrees = 0
        Direction.RIGHT_UP:
            rotation_degrees = 315
            z_index = 0
        Direction.RIGHT_DOWN:
            rotation_degrees = 45
            z_index = 1
        Direction.LEFT:
            rotation_degrees = 180
        Direction.LEFT_UP:
            rotation_degrees = 225
            z_index = 0
        Direction.LEFT_DOWN:
            rotation_degrees = 135
            z_index = 1
        Direction.UP:
            rotation_degrees = 270
            z_index = 0
        Direction.DOWN:
            rotation_degrees = 90
            z_index = 1
            
    return $RangedWeaponSprite.global_position
