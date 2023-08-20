extends Node

#runtime values
var current_world : int = 1
var current_level : int = 1

#values
const worlds_count : int = 5
const levels_count : int = 5

#game data
const volume = "volume"
const world = "world"
const level = "level"

#game files
const app_config_file = "app_config_file.res"
const settings_section = "settings_section"
const world_and_level_section = "world_and_level_section"


const error_OK = Error.OK
const error_ERR_FILE_CANT_OPEN = Error.ERR_FILE_CANT_OPEN

#hud data type
enum  Data_Type {SCORE, HEALTH}

func hud_data(type: Data_Type, value):
	return {type: value}

func set_volumne(value: bool):
	_set_data(app_config_file, settings_section, volume, value)

func get_volume():
	return _get_data(app_config_file, settings_section, volume, true)

func set_world(value: int):
	_set_data(app_config_file, world_and_level_section, world, value)

func get_world():
	return _get_data(app_config_file, world_and_level_section, world, 1)

func set_level(value: int):
	_set_data(app_config_file, world_and_level_section, level, value)

func get_level():
	return _get_data(app_config_file, world_and_level_section, level, 1)

#private functions
func _set_data(filename: String, section: String, field: String, value):
	var config_file = ConfigFile.new()
	
	config_file.set_value(section, field, value)
	
	config_file.save(filename)

func _get_data(filename: String, section: String, field: String, default_value):
	var config_file = ConfigFile.new()

	config_file.load(filename)
	
	var result = config_file.get_value(section, field)

	if result == null:
		config_file.set_value(section, field, default_value)
		
		result = default_value
		
		config_file.save(filename)
	
	return result
