extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var timer : Timer = Timer.new()
	
	var callable : Callable = Callable(self, "_move_to_home_screen")
	
	timer.connect("timeout", callable)
	
	add_child(timer)
	timer.start(2)
	
	pass # Replace with function body.

func _move_to_home_screen():
	get_tree().change_scene_to_file("res://screens/worlds.tscn")
	pass
