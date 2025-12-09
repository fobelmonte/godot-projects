extends CharacterBody2D

@export var speed : int
@export var projectile: PackedScene

func _physics_process(_delta: float) -> void:
	if !GameManager.isGameStarted || GameManager.isGameOver:
		return
	
	playerMovement()
	
	if Input.is_action_just_pressed("Shoot"):
		createProjectile()

func playerMovement():
	var inputX= Input.get_axis("Left", "Right")
	var inputY= Input.get_axis("Up", "Down")
	velocity=Vector2(inputX, inputY) * speed
	move_and_slide()
	
func createProjectile():
	var projectileInstance = projectile.instantiate()
	add_sibling(projectileInstance)
	projectileInstance.position= position

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroids"):
		queue_free()
		GameManager.setGameOver(true)
