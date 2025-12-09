extends Node2D

@export var powerUpScene: PackedScene
@onready var timer: Timer = $Timer

var minX
var maxX
var minY
var maxY

func _ready() -> void:
	minX=0
	maxX=get_viewport().size.x / 2
	minY=0
	maxY=get_viewport().size.y
	
func _on_timer_timeout() -> void:
	createPowerUp()
	
func createPowerUp():
	if !GameManager.isGameStarted:
		return
		
	if GameManager.isGameOver:
		timer.stop()
		return
		
	var powerUpInstance = powerUpScene.instantiate()
	add_child(powerUpInstance)
	var randomX= randf_range(minX, maxX)
	var randomY= randf_range(minY, maxY)
	powerUpInstance.position=Vector2(randomX, randomY)
