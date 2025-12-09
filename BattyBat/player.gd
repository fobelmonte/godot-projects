extends CharacterBody2D
class_name Player

signal on_game_started

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

var gravity=1000
var jump_force=400
var max_speed=400
var rotation_speed=2

var is_started=false
var should_process_input=true

func _process(delta: float) -> void:
	if Input.is_action_pressed("jump") and should_process_input:
		if is_started == false:
			is_started=true
			on_game_started.emit()
		jump()
		animated_sprite_2d.play("fly")
			
	if is_started == false:
		return
		
	velocity.y += gravity*delta
	velocity.y = min(velocity.y, max_speed)
		
	move_and_slide()
	rotate_player()
		
func jump()->void:
	velocity.y = -jump_force
	rotation = deg_to_rad(-30)
	jump_audio.play()
	
func rotate_player()->void:
	if velocity.y>0 and rad_to_deg(rotation)<90:
		rotation += rotation_speed * deg_to_rad(1)

func stop_movement():
	animated_sprite_2d.play("defeat")
	should_process_input = false
	
func stop_gravity():
	gravity = 0
	velocity = Vector2.ZERO
