extends Area2D

func _ready():
	$AnimatedSprite2D.play("idle")


func _on_area_entered(area):
	if(area.is_in_group("player")):
		queue_free()
