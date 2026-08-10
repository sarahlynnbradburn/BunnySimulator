extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/StateMachine/playback") as AnimationNodeStateMachinePlayback


func _on_area_2d_player_entered() -> void:
	print("player entered signal recieved by buttercup")
	playback.travel("request_grooming")

func _on_area_2d_player_exited() -> void:
	print("player exited signal recieved by buttercup")
	playback.travel("stand")
