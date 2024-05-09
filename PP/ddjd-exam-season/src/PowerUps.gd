extends Node


func ranged_weapon_PU_on():
    $RangeUp.visible = true
    $RangedUpTimer.stop()
    $RangedUpTimer.start()
    $RangedUpBlink.play("Stop")
    

func ranged_weapon_PU_off():
    $RangeUp.visible = false

func melee_weapon_PU_on():
    $MeleeUp.visible = true
    $MeleeUpTimer.stop()
    $MeleeUpTimer.start()
    $MeleeUpBlink.play("Stop")
    
func melee_weapon_PU_off():
    $MeleeUp.visible = false
    
func speed_PU_on():
    $SpeedUp.visible = true
    $SpeedUpTimer.stop()
    $SpeedUpTimer.start()
    $SpeedUpBlink.play("Stop")
    
func speed_PU_off():
    $SpeedUp.visible = false
    
    
func _on_MeleeUpTimer_timeout():
    $MeleeUpTimer.stop()
    $MeleeUpBlink.play("Blink")


func _on_RangedUpTimer_timeout():
    $RangedUpTimer.stop()
    $RangedUpBlink.play("Blink")


func _on_SpeedUpTimer_timeout():
    $SpeedUpTimer.stop()
    $SpeedUpBlink.play("Blink")
