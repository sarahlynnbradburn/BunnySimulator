extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 200.0
var latest_direction = "right"

func _physics_process(delta):
		# Get player input (-1 to 1) for all four directions
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Move the character using physics
	velocity = input_vector * SPEED

	move_and_slide()
	
	# Change animations based on movement
	if velocity.length() > 0:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				animated_sprite_2d.play("walk_right")
				latest_direction = "right"
			else:
				animated_sprite_2d.play("walk_left")
				latest_direction = "left"
		else:
			if velocity.y > 0:
				animated_sprite_2d.play("walk_down")
				latest_direction = "down"
			else:
				animated_sprite_2d.play("walk_up")
				latest_direction = "up"
				
	else:
		if latest_direction == "right":
			animated_sprite_2d.play("stand_right")
		if latest_direction == "left":
			animated_sprite_2d.play("stand_left")	
		if latest_direction == "up":
			animated_sprite_2d.play("stand_up")
		if latest_direction == "down":
			animated_sprite_2d.play("stand_down")
		

		
