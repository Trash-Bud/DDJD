extends Node


func weapon_switch(weapon):
    match(weapon):
        WeaponType.RANGED:
            $RangedSquare.color = "#ff0505"
            $MeleeSquare.color = "#3c3d47"
        WeaponType.MELEE:
            $MeleeSquare.color = "#ff0505"
            $RangedSquare.color = "#3c3d47"
