extends Node



func _on_HUB_start():
    var children = get_children()
    for child in children:
        remove_child(child)
        child.queue_free()
