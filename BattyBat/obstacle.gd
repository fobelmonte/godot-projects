extends Node2D
class_name Obstacle

signal on_player_crashed
signal on_player_scored

@onready var hit_sound: AudioStreamPlayer2D = $HitSound
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound

var mov_speed=150

func _process(delta: float) -> void:
	position.x -= mov_speed*delta
	
func set_speed(value: float)->void:
	mov_speed = value

func on_area_body_entered(_body: Node2D):
	on_player_crashed.emit()
	hit_sound.play()
	
func _on_score_area_body_entered(_body: Node2D) -> void:
	on_player_scored.emit()
	score_sound.play()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
