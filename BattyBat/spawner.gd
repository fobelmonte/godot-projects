extends Node
class_name Spawner

signal on_obstacle_crash
signal on_player_score

const OBSTACLE_SCENE = preload("res://Scenes/obstacle.tscn")

@onready var timer: Timer = $Timer

func spawn_obstacle():
	var obs_instance: Obstacle = OBSTACLE_SCENE.instantiate()
	obs_instance.on_player_crashed.connect(on_player_crashed)
	obs_instance.on_player_scored.connect(on_player_scored)

	var viewport: Viewport = get_viewport()
	obs_instance.position.x = viewport.get_visible_rect().end.x+150

	var half_height = viewport.size.y / 2
	obs_instance.position.y = randf_range (half_height + 150, half_height - 150)
	
	add_child(obs_instance)
	
func _on_timer_timeout() -> void:
	spawn_obstacle()

func stop_obstacles():
	timer.stop()
	for obs: Obstacle in get_children().filter(func(x): return x is Obstacle):
		obs.set_speed(0)

func on_player_crashed():
	on_obstacle_crash.emit()
	stop_obstacles()
	
func on_player_scored():
	on_player_score.emit()
