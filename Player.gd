extends KinematicBody2D

signal start


var velocity = Vector2()
var max_rotation = PI/4
var min_rotation = -PI/4
var speed = 10

#var rotation_dir = 0
#var rotation_speed = 1.5
#func _physics_process(delta):
#	var acceleration = Global.stats['acceleration']
#	var max_speed = Global.stats['max_speed']
#	rotation_dir = 0
#	velocity.y += 10
#	if Input.is_action_pressed('ui_right'):
#		rotation_dir += 1
#	if Input.is_action_pressed('ui_left'):
#		rotation_dir -= 1
#	if Input.is_action_pressed("ui_select"):
#		speed += acceleration* delta
#		if speed >= max_speed:
#			speed = max_speed
#		velocity = Vector2(0, -speed).rotated(rotation)
#
#		if Global.stats['acceleration']==1000 and Global.stats['max_speed']==2000:
#			$PlayerSprite/Sprite2.show()
#			$PlayerSprite/Sprite.hide()
#		else:
#			$PlayerSprite/Sprite.show()
#			$PlayerSprite/Sprite2.hide()
#
#		$PlayerSprite/AnimationPlayer.current_animation = 'New Anim'
#		$PlayerSprite/Sprite.show()
#		if $Fuel.time_left == 0:
#			$Fuel.start(Global.stats['Fuel'])
#			emit_signal('start')
#		if $Fuel.is_paused():
#			$Fuel.set_paused(false)
#	if Input.is_action_just_released('ui_select'):
#		speed = 1
#		$PlayerSprite/Sprite.hide()
#		if not $Fuel.is_paused():
#			$Fuel.set_paused(true)
#	rotation += rotation_dir * rotation_speed * delta
#	if rotation >= max_rotation:
#		rotation = max_rotation
#	if rotation <= min_rotation:
#		rotation = min_rotation
#	velocity = move_and_slide(velocity)
#	position.x = clamp(position.x, 25, 2023)
#	if Global.stats['health'] <= 0:
#		explode()
#	Global.vol_stats['score'] = int((1200-global_position.y)/10)
#	print(global_position.y)
	
func _physics_process(delta):
	var acceleration = Global.stats['acceleration']
	var max_speed = Global.stats['max_speed']
	velocity.y += 10
	rotation = Input.get_accelerometer().x *(PI/24)
	if rotation >= max_rotation:
		rotation = max_rotation
	if rotation <= min_rotation:
		rotation = min_rotation
	if rotation < 0.6 *(PI/24) and rotation >-0.6* (PI/24):
		rotation = 0
	if Input.is_action_pressed("press"):
		speed += acceleration* delta
		if speed >= max_speed:
			speed = max_speed
		velocity = Vector2(0, -speed).rotated(rotation)
		#$Particles2D.emitting = true
		if Global.stats['acceleration']==1000 and Global.stats['max_speed']==1000:
			$PlayerSprite/Sprite2.show()
			$PlayerSprite/Sprite.hide()
			$EngineSound.volume_db = 1
		else:
			$PlayerSprite/Sprite.show()
			$PlayerSprite/Sprite2.hide()
			$EngineSound.volume_db = -7

		if Global.stats['effect'] == 1:
			if $EngineSound.playing ==false:
				$EngineSound.playing = true

		$PlayerSprite/AnimationPlayer.current_animation = 'New Anim'
		$PlayerSprite/Sprite.show()
		print($Fuel.time_left)
		if $Fuel.time_left == 0:
			$Fuel.start(Global.stats['Fuel'])
			emit_signal('start')
		if $Fuel.is_paused():
			$Fuel.set_paused(false)
	if Input.is_action_just_released('press'):
		speed = 10
		#$Particles2D.emitting = false
		$PlayerSprite/Sprite.hide()

		if $EngineSound.playing ==true:
			$EngineSound.playing=false

		if not $Fuel.is_paused():
			$Fuel.set_paused(true)
	velocity = move_and_slide(velocity)
	position.x = clamp(position.x, 25, 2023)
	if Global.stats['health']<=0:
		explode()
	Global.vol_stats['score'] = int((1200-global_position.y)/10)
	
	
		
func explode():
	$Fuel.stop()
	set_physics_process(false)
	set_process(false)
	$CollisionShape2D.disabled = true
	$EngineSound.playing = false
	$PlayerSprite/Sprite.hide()
	$PlayerSprite.hide()
	$AnimatedSprite.show()
	$AnimatedSprite.play('explosion')
	if Global.stats['effect']==1:
		$ExplosionSound.playing = true
		yield(get_tree().create_timer(3.46),'timeout')
		$ExplosionSound.playing = false
	if Global.stats['effect']==0:
		yield(get_tree().create_timer(3),'timeout')
	Global.stats['coins'] += Global.vol_stats['score']
	get_parent().game_over()
	
	
func _on_Fuel_timeout():
	$Fuel.stop()
	set_collision_layer_bit(1, false)
	set_physics_process(false)
	set_process(true)
	
func _process(delta):
	velocity.y += 10
	
	$PlayerSprite/Sprite2.hide()
	$PlayerSprite/Sprite.hide()
	$EngineSound.playing = false
	move_and_slide(Vector2(0, velocity.y))
	if global_position.y >= 1200:
		explode()
	

