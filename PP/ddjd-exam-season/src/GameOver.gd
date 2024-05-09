extends Node


var was_open = false

func show():
    $GameOver.visible = true
    $RestartButton.visible = true

func hide():
    $GameOver.visible = false
    $RestartButton.visible = false


func _on_Credits_credits_open():
    if $RestartButton.visible:
        $RestartButton.visible = false
        was_open = true


func _on_Credits_credits_close():
    if was_open:
        $RestartButton.visible = true
        was_open = false
