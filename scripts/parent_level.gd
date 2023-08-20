extends Node2D

var game_data: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var current_level : int = Configuration.current_level
	var current_world : int = Configuration.current_world
	
	game_data = "World: " + str(current_world) + " | Level: " + str(current_level)
	$HUD/Label.text = game_data
	
	var level_node = load(genereate_level_name(current_world, current_level))

	add_child(level_node.instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_hud(data: Dictionary):
	
	pass


func genereate_level_name(world: int, level: int):
	
	var parent_name: String = "res://screens/levels/"
	var level_name: String = "Level_" + str(world) + "_" + str(level) + ".tscn"
	
	return parent_name + level_name
