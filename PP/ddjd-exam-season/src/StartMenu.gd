extends Node


var was_open = false

func show():
    $Tittle.visible = true
    $StartButton.visible = true

func hide():
    $Tittle.visible = false
    $StartButton.visible = false



func _on_Credits_credits_open():
    if $StartButton.visible:
        $StartButton.visible = false
        was_open = true


func _on_Credits_credits_close():
    if was_open:
        $StartButton.visible = true
        was_open = false
