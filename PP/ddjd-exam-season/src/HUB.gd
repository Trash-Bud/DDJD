extends CanvasLayer

signal start

func update_score(value):
    $Score.update(value)

func _on_Player_ranged_weapon_power_up(val):
    $PowerUps.ranged_weapon_PU_on()


func _on_Player_melee_weapon_power_up(val):
    $PowerUps.melee_weapon_PU_on()


func _on_Player_speed_power_up():
    $PowerUps.speed_PU_on()
    

func _on_Player_melee_weapon_power_up_off():
    $PowerUps.melee_weapon_PU_off()


func _on_Player_ranged_weapon_power_up_off():
    $PowerUps.ranged_weapon_PU_off()


func _on_Player_speed_power_up_off():
    $PowerUps.speed_PU_off()

func _on_Player_hit(new_health):
    $Health.hit(new_health)


func _on_Player_dead():
    $GameOver.show()
    $Credits.show()


func _on_Player_switch_weapon(weapon):
    $Weapons.weapon_switch(weapon)


func _on_TextureButton_pressed():
    emit_signal("start")
    $GameOver.hide()
    $Score.reset()
    $Health.reset()
    $Credits.hide()



func _on_StartButton_pressed():
    emit_signal("start")
    $StartMenu.hide()
    $Credits.hide()

func _on_Scoring_new_stage(stage):
    $Score.blink()
