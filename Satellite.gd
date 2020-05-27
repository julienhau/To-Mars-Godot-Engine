extends RigidBody2D


func _ready():
	linear_velocity=Vector2([50,25,-25,-50][randi() % 4],0)

func _process(delta):
	if linear_velocity.x>0:
		$Sprite.flip_h = true
		$CollisionPolygon2D.set_scale(Vector2(-1,1))
		if position.x > 2048 and position.x < 2055:
			linear_velocity.x = -linear_velocity.x
	if linear_velocity.x<0:
		$Sprite.flip_h = false
		$CollisionPolygon2D.set_scale(Vector2(1,1))
		if position.x > 0 and position.x < 5:
			linear_velocity.x = -linear_velocity.x
			



func _on_Satellite_body_entered(body):
	if Global.stats['max_speed']==400:
		hide()
		if Global.stats['effect']==1:
			$BoomSound.playing = true
			yield(get_tree().create_timer(0.64),'timeout')
		queue_free()
		if (randi() % 2) == 1:
			Global.stats['health'] -= 50
			Global.vol_stats['satellites'] +=1
	
	else:
		hide()
		if Global.stats['effect']==1:
			$BoomSound.playing = true
			yield(get_tree().create_timer(0.64),'timeout')
		queue_free()
		Global.stats['health'] -= 50
		Global.vol_stats['satellites'] +=1
