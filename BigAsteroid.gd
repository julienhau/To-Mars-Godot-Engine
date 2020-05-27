extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_user_signal('big')
	var rot = rand_range(0,360)
	$Sprite.rotation_degrees += rot
	$CollisionShape2D.rotation_degrees += rot


func _on_BigAsteroid_body_entered(body):
	if Global.stats['max_speed']==400:
		if (randi() % 2) == 1:
			Global.stats['health'] -= 100
	else:
		Global.stats['health'] -= 100
