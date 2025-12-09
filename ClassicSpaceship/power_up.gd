extends Area2D



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		var asteroids = get_tree().get_nodes_in_group("asteroids")
		
		for i in asteroids:
			i.destroy()
			
		queue_free()
