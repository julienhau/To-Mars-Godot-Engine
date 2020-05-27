extends RigidBody2D



func _ready():
	
	pass

func _on_Obstacle_body_entered(body):
	if Global.stats['max_speed']==400:
		queue_free()
		if (randi() % 2) == 1:
			Global.stats['health'] -= 3
			Global.vol_stats['balloons'] += 1
			
	else:
		queue_free()
		Global.stats['health'] -= 3
		Global.vol_stats['balloons'] += 1
	
	
	
