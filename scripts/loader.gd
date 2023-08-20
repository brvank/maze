extends Node

var loader_class = preload("res://screens/loader.tscn")

func load(tree : SceneTree, callback : Callable):
	
	var loader = loader_class.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	
	tree.call_deferred("add_child", loader)
	
	callback.call()
	
	#loader.queue_free()
	
	pass
