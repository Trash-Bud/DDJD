extends KinematicBody2D

signal hit
signal dead
signal pickup_coin
signal speed_power_up
signal ranged_weapon_power_up
signal melee_weapon_power_up
signal speed_power_up_off
signal ranged_weapon_power_up_off
signal melee_weapon_power_up_off
signal switch_weapon

var clockwise_dirs = [ Direction.LEFT, Direction.LEFT_UP, 
Direction.UP, Direction.RIGHT_UP, Direction.RIGHT, 
Direction.RIGHT_DOWN, Direction.DOWN, Direction.LEFT_DOWN]

const BASE_SPEED = 400
export var speed = 400 # How fast the player will move (pixels/sec).
export var health = 5

var immune = false
var immovable = true
var current_direction = Direction.DOWN;
var current_weapon = WeaponType.MELEE

const TURN_MARGIN = PI/8

func _ready():
    position = get_node("../StartPosition").position
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    if !immovable:
        player_control(delta)



func player_control(delta):
    
    var velocity = Vector2.ZERO # The player's movement vector.

    if Input.is_action_pressed("move_right"):
        current_direction = Direction.RIGHT
        velocity.x += 1
    if Input.is_action_pressed("move_left"):
        current_direction = Direction.LEFT
        velocity.x -= 1
    if Input.is_action_pressed("move_down"):
        if Input.is_action_pressed("move_right"):
            current_direction = Direction.RIGHT_DOWN
        elif Input.is_action_pressed("move_left"):
            current_direction = Direction.LEFT_DOWN
        else:
            current_direction = Direction.DOWN
        velocity.y += 1
    if Input.is_action_pressed("move_up"):
        if Input.is_action_pressed("move_right"):
            current_direction = Direction.RIGHT_UP
        elif Input.is_action_pressed("move_left"):
            current_direction = Direction.LEFT_UP
        else:
            current_direction = Direction.UP
        velocity.y -= 1
        
    if Input.is_action_just_released("switch_weapon"):
        if current_weapon == WeaponType.MELEE:
            current_weapon = WeaponType.RANGED
            $RangedWeapon.visible = true
            $MeleeWeapon.visible = false
        elif current_weapon == WeaponType.RANGED:
            current_weapon = WeaponType.MELEE
            $MeleeWeapon.visible = true
            $RangedWeapon.visible = false
        emit_signal("switch_weapon",current_weapon)
        
    # Update range weapon position if it is visble
    
        
    if Input.is_action_just_pressed("attack"):
        var shot_pos = get_global_mouse_position() - position
        var shot_angle = shot_pos.angle()
        convert_mouse_angle_to_dir(shot_angle)
        if (current_weapon == WeaponType.RANGED):
            $RangedWeapon.change_direction(current_direction)
            $RangedWeapon.shoot(shot_pos)
        else:
            $MeleeWeapon.change_direction(current_direction)
            $MeleeWeapon.attack()
    else:
        if current_weapon == WeaponType.RANGED:
            $RangedWeapon.change_direction(current_direction)
        else:
            $MeleeWeapon.change_direction(current_direction)

    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        $AnimatedSprite.walk(current_direction)
    else: 
        $AnimatedSprite.turn(current_direction)
        
    move_and_collide(velocity * delta)


func convert_mouse_angle_to_dir(angle):
    var index = 0
    
    if abs(PI -angle) < TURN_MARGIN:
        current_direction = Direction.LEFT
        return
    
    for cardinal in range(-4,4):
        var card_angle = cardinal * PI/4
        if card_angle - TURN_MARGIN < angle  &&  angle <= (card_angle + TURN_MARGIN):
            current_direction = clockwise_dirs[index]
            break
        index += 1




func start(pos):
    position = pos
    show()
    $CollisionShape2D.disabled = false




func _on_SpeedPowerUpTimer_timeout():
    speed = BASE_SPEED
    $SpeedPowerUpTimer.stop()
    emit_signal("speed_power_up_off")


func _on_MeleeATKPowerUpTimer_timeout():
    emit_signal("melee_weapon_power_up_off")


func _on_RangedATKPowerUpTimer_timeout():
    emit_signal("ranged_weapon_power_up_off")


func _on_ImmunityTimer_timeout():
    $ImmunityTimer.stop()
    immune = false
    $AnimationPlayer.play("not immune")
    


func _on_HurtBox_area_entered(area):
    if area is Projectile:
        if area.enemy:
            take_damage()
            area.hit()
    else:
        var val = area.pick_up()
        colllect(val[0],val[1])


func _on_HurtBox_body_entered(body):
    take_damage()


func colllect(type, value):
    match(type):
        CollectibleType.SPEED:
            $SpeedPowerUpTimer.stop()
            emit_signal("speed_power_up")
            speed = BASE_SPEED + value
            $SpeedPowerUpTimer.start()
        CollectibleType.MELEE_ATK_UP:
            $MeleeATKPowerUpTimer.stop()
            emit_signal("melee_weapon_power_up",value)
            $MeleeATKPowerUpTimer.start()
        CollectibleType.RANGE_ATK_UP:
            $RangedATKPowerUpTimer.stop()
            emit_signal("ranged_weapon_power_up",value)
            $RangedATKPowerUpTimer.start()
        CollectibleType.SCORE:
            emit_signal("pickup_coin",value)


func take_damage():
    if !immune:
        health -= 1
        emit_signal("hit", health)
        if health <= 0:
            immovable = true
            emit_signal("dead")
            $AnimatedSprite.play("die")
        else:
            immune = true
            $ImmunityTimer.start()
            $AnimationPlayer.play("immune")
        pass


func _on_HUB_start():
    position = get_node("../StartPosition").position
    $AnimatedSprite.play("down")
    immovable = false
    health = 5
