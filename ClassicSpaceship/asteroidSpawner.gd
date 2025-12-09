extends Marker2D

@export var asteroids: Array[PackedScene]

@export var maxY:float
@export var minY:float

@onready var timer: Timer = $Timer

func createAsteroid():
	if 	GameManager.isGameOver:
		timer.stop()
	
	var randomAsteroidScene=asteroids.pick_random()
	var randomAsteroidInstance = randomAsteroidScene.instantiate()
	add_child(randomAsteroidInstance)
	var randomY= randf_range(minY, maxY)
	randomAsteroidInstance.global_position.y=randomY

func _on_timer_timeout() -> void:
	if !GameManager.isGameStarted:
		return
	var instances = 3
	for i in range(instances):
		createAsteroid()
