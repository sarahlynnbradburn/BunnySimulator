extends Area2D

var player_in_zone: bool = false

func _ready() -> void:
	# 1. Bypasses the UI to connect the signal directly in code
	self.body_entered.connect(_on_collision_object_entered)
	self.body_exited.connect(_on_collision_object_exited)

# 2. This function automatically runs the instant a physics body enters
func _on_collision_object_entered(body: Node2D) -> void:
	# 3. Prints the exact name of the node that just crossed into the area
	if(body.name == "Player"):
		print("Player entered interact zone! Node name: ", body.name)
		player_in_zone = true
		
func _on_collision_object_exited(body: Node2D) -> void:
	if(body.name == "Player"):
		print("Player exited interact zone! Node name: ", body.name)
		player_in_zone = false
		

	
