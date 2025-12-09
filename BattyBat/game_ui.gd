extends CanvasLayer
class_name GameUI

const MEDAL_BRONZE = preload("res://Sprites/UI/bronzeMedal.png")
const MEDAL_SILVER = preload("res://Sprites/UI/silverMedal.png")
const MEDAL_GOLD = preload("res://Sprites/UI/goldMedal.png")

@onready var current_score: Label = %CurrentScore
@onready var high_score: Label = %HighScore
@onready var medal_image: TextureRect = %MedalImage

@onready var score_label: Label = %ScoreLabel
@onready var start_menu: Control = %StartMenu
@onready var game_over_menu: VBoxContainer = %GameOverMenu


func _ready() -> void:
	score_label.text = "0"
	
func update_score(value: int)->void:
	score_label.text = str(value)
	
func calculate_score(score: int, high: int)->void:
	current_score.text = str(score)
	high_score.text = str(high)
	if score >= 20:
		medal_image.texture = MEDAL_GOLD
	elif score >=10:
		medal_image.texture = MEDAL_SILVER
	else:
		medal_image.texture = MEDAL_BRONZE

func game_over():
	game_over_menu.show()
	score_label.hide()

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
