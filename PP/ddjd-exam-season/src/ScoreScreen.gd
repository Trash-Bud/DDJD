extends Node


func update(value):
    $score_label.text = str(value)

func reset():
    $score_label.text = "0"

func blink():
    $AnimationPlayer.play("blink")
    $AnimationTimer.start()

func _on_AnimationTimer_timeout():
    $AnimationPlayer.play("stop")
    $AnimationTimer.stop()
