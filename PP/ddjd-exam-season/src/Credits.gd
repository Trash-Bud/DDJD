extends Node

signal credits_open
signal credits_close

func _on_CreditsButton_pressed():
    $Credits.visible = true
    $CreditsButton.visible = false
    $BackButton.visible = true
    $Background.visible = true
    emit_signal("credits_open")


func _on_BackButton_pressed():
    $Credits.visible = false
    $CreditsButton.visible = true
    $BackButton.visible = false
    $Background.visible = false
    emit_signal("credits_close")

func hide():
    $CreditsButton.visible = false
    
func show():
    $CreditsButton.visible = true
