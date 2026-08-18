extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/StateMachine/playback") as AnimationNodeStateMachinePlayback
var HEART_EFFECT = preload("res://buttercup/heart_effect.tscn")


func _ready() -> void:
	SignalBus.groom_buttercup.connect(play_heart_animation)


func _on_area_2d_player_entered() -> void:
	print("player entered signal recieved by buttercup")
	playback.travel("request_grooming")

func _on_area_2d_player_exited() -> void:
	print("player exited signal recieved by buttercup")
	playback.travel("stand")

func play_heart_animation() -> void:
	var heart_instance = HEART_EFFECT.instantiate()
	get_tree().current_scene.add_child(heart_instance)
	heart_instance.global_position = global_position
