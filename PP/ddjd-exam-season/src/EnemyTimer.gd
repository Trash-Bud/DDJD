extends Timer

var base_time = 4

func _on_Player_dead():
    stop()


func _on_HUB_start():
    start()


func _on_Scoring_new_stage(stage):
    wait_time = 4 / (stage + 1)

