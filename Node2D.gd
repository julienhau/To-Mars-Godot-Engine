extends Node2D


var speed = 2  # rotation speed (in radians)
var radius = 250  # desired orbit radius
func _ready():
	$Sprite.position = Vector2(radius, 0) # desired orbit radius

func _process(delta):
	rotation -= speed * delta


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
