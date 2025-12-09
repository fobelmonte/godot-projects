extends Control

func _ready() -> void:
	if GameManager.isGameStarted:
		queue_free()

func _process(_delta: float) -> void:
	if GameManager.isGameStarted:
		queue_free()
