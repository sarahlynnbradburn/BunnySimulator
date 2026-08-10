extends Area2D
signal player_entered;
signal player_exited;

func _ready() -> void:
	# 1. Bypasses the UI to connect the signal directly in code
	self.body_entered.connect(_on_collision_object_entered)
	self.body_exited.connect(_on_collision_object_exited)

# 2. This function automatically runs the instant a physics body enters
func _on_collision_object_entered(body: Node2D) -> void:
	# 3. Prints the exact name of the node that just crossed into the area
	if(body.name == "Player"):
		print("An object has entered! Node name: ", body.name)
		player_entered.emit()
		
func _on_collision_object_exited(body: Node2D) -> void:
	if(body.name == "Player"):
		print("An object has exited! Node name: ", body.name)
		player_exited.emit()
	
