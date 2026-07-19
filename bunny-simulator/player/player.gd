extends CharacterBody2D

var input_vector = Vector2.ZERO
const SPEED = 200.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/StateMachine/playback") as AnimationNodeStateMachinePlayback



func _physics_process(delta: float) -> void:
	var state = playback.get_current_node()	
	match state:
		"MoveState": move_state(delta)
		
func move_state(delta: float) -> void:
	input_vector = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
			
	if input_vector != Vector2.ZERO:
		#y-axis is counterintuative in godot (and most game engines)
		#this lets us set up the animations intuatively in the blend 
		#state and then just inverse the direction calculation
		var direction_vector: = Vector2(input_vector.x, -input_vector.y)
				
		update_blend_positions(direction_vector)	
		
	velocity = input_vector * SPEED
	move_and_slide()

func update_blend_positions(direction_vector: Vector2) -> void:
	#Calling functions will go down the tree 
	animation_tree.set("parameters/StateMachine/MoveState/StandState/blend_position", direction_vector)
	animation_tree.set("parameters/StateMachine/MoveState/WalkState/blend_position", direction_vector)
