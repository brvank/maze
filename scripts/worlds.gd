extends GridContainer

const worlds_count : int = Configuration.worlds_count
const tab_size : int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	
	_create_worlds_tab()
	
	_set_columns_count()

func _create_worlds_tab():
	
	var world_active : int = Configuration.get_world()
	
	for i in range(worlds_count):
		var position = i + 1
		var world : Button = Button.new()
		world.text = "World " + str(position)
		if position <= world_active:
			world.disabled = false
		else :
			world.disabled = true
		var callable : Callable = Callable(self, "_on_world_pressed").bind(position)
		world.connect("pressed", callable)
		add_child(world)
	
	pass

func _set_columns_count():
	columns = size.x / tab_size
	pass

func _on_item_rect_changed():
	_set_columns_count()
	pass # Replace with function body.

func _on_world_pressed(position):
	Configuration.current_world = position
	get_tree().change_scene_to_file("res://screens/levels.tscn")
