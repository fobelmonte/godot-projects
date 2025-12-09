extends Node2D

const SAVE_FILE: String = "user://score.sav"

@onready var spawner: Spawner = $spawner
@onready var player: Player = $player
@onready var game_ui: GameUI = $GameUI
@onready var ground: Ground = $Ground
@onready var top: Ground = $Top


var score = 0
var high_score = 0

func _ready() -> void:
	load_highscore()
	
func save_highscore():
	if score > high_score:
		high_score=score
		var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
		file.store_32(high_score)
	
func load_highscore():
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if file:
		high_score = file.get_32()

func _on_player_on_game_started() -> void:
	spawner.timer.start()
	game_ui.start_menu.hide()
	
func _on_spawner_on_obstacle_crash() -> void:
	player.stop_movement()
	top.stop_ground()
	ground.stop_ground()
	
func _on_ground_on_player_crashed() -> void:
	top.stop_ground()
	ground.stop_ground()
	spawner.stop_obstacles()
	game_ui.game_over()
	game_ui.calculate_score(score, high_score)

func _on_spawner_on_player_score() -> void:
	score += 1
	game_ui.update_score(score)
	save_highscore()
