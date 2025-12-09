extends Control

@onready var scoreLabel: Label = %ScoreLabel

func _process(_delta: float) -> void:
	if GameManager.isGameOver:
		visible=true
		scoreLabel.text = "Your final score is: " + str(GameManager.score)
