extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_user_signal('hug')




func _on_HugeAsteroid_body_entered(body):
	if Global.stats['max_speed']==400:
		if (randi() % 2) == 1:
			Global.stats['health'] -=150
	else:
		Global.stats['health'] -=150
