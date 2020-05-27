extends RigidBody2D


func _process(delta):
	if global_position.y> get_node('../Player2').position.y+1000:
		queue_free()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().connect('new',self,'on_new_game')
	var rot = rand_range(0,360)
	$Sprite.rotation_degrees += rot
	$CollisionShape2D.rotation_degrees += rot

func on_new_game():
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Asteroid_body_entered(body):

	Global.stats['health'] -= 70
