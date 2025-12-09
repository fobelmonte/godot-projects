extends Area2D

var randomSpeed
var randomRotationSpeed
var minSpeed=300
var maxSpeed=400
var maxRotationSpeed=180
var minRotationSpeed=-180

@export var points: int
@export var explosionScene : PackedScene

func _ready() -> void:
	randomSpeed = randf_range(minSpeed, maxSpeed)
	randomRotationSpeed = randf_range(minRotationSpeed, maxRotationSpeed)

func _process(delta: float) -> void:
	position.x-=randomSpeed*delta
	rotation_degrees += randomRotationSpeed*delta

func _on_area_entered(area: Area2D) -> void:
	var playerCollision = area.is_in_group("player")
	var projectileCollision = area.is_in_group("projectile")

	if projectileCollision:
		GameManager.addScore(points)

	if playerCollision || projectileCollision:
		destroy()

func destroy():
	var explosionInstance = explosionScene.instantiate()
	add_sibling(explosionInstance)
	explosionInstance.position=position
	queue_free()
