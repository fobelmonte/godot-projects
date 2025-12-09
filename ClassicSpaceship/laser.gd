extends Area2D

@export var speed : int

func _process(delta: float) -> void:
	position.x+=speed*delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroids"):
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
		queue_free()
