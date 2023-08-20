extends CharacterBody2D

signal update_player_data(data: Dictionary)

const SPEED = 400.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	#$Camera2D.position = position
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x != 0:
		$AnimatedSprite2D.play("running")
		if velocity.x > 0:
			$AnimatedSprite2D.scale = Vector2(1, 1)
		else:
			$AnimatedSprite2D.scale = Vector2(-1, 1)
		
	else:
		$AnimatedSprite2D.play("idle")
		
	if velocity.y != 0:
		$AnimatedSprite2D.play("jump")
	move_and_slide()

func _on_area_2d_area_entered(area):
	if(area.is_in_group("coin")):
		print("coin detected")
