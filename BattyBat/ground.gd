extends Node2D
class_name Ground

signal on_player_crashed
var speed = -150

@onready var game_over_sound: AudioStreamPlayer2D = $GameOverSound

@onready var ground_1: Area2D = $Ground1
@onready var ground_2: Area2D = $Ground2
@onready var sprite_2d: Sprite2D = %Sprite2D

var width : float

func _ready() -> void:
	width = sprite_2d.texture.get_width()
	
func _process(delta: float) -> void:
	ground_1.global_position.x += speed * delta
	ground_2.global_position.x += speed * delta
	
	if ground_1.global_position.x < -width / 2:
		ground_1.global_position.x = ground_2.global_position.x + width
	if ground_2.global_position.x < -width / 2:
		ground_2.global_position.x = ground_1.global_position.x + width

func on_ground_body_entered(body: Node2D) -> void:
	on_player_crashed.emit()
	stop_ground()
	var player : Player = body as Player
	player.stop_movement()
	player.stop_gravity()
	game_over_sound.play()

func stop_ground():
	speed=0
