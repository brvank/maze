extends GridContainer

const levels_count : int = Configuration.levels_count
var current_world : int = Configuration.current_world
const tab_size : int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	
	_create_levels_tab()
	
	_set_columns_count()

func _create_levels_tab():
	
	var world_active : int = Configuration.get_world()
	var level_active : int = Configuration.get_level()
	
	for i in range(levels_count):
		var curr_position = i + 1
		var level : Button = Button.new()
		level.text = "Level " + str(current_world) + ":" + str(curr_position)
		if current_world < world_active || curr_position <= level_active:
			level.disabled = false
		else:
			level.disabled = true
		var callable : Callable = Callable(self, "_on_level_pressed").bind(curr_position)
		level.connect("pressed", callable)
		add_child(level)

func _set_columns_count():
	columns = size.x / tab_size

func _on_item_rect_changed():
	_set_columns_count()

func _on_level_pressed(level):
	Configuration.current_level = level
	get_tree().change_scene_to_file("res://screens/levels/parent_level.tscn")
